module Spree
  class ReferralProgramReward::ProcessOrder
    def initialize(order)
      @order = order
    end

    def call
      raise ArgumentError.new('Reward for order already processed') if current_reward
      
      create_reward if eligible?
    end

    private

    def eligible?
      referrer.present? && current_reward.nil?
    end

    def current_reward
      Spree::ReferralProgramReward.find_by(order: @order)
    end

    def referrer
      reward_user_promotion_action&.promotion_action_reward_user&.user
    end

    def reward_user_promotion_action
      @order.promotions.map do |promotion|
        promotion.actions.find_by(type:  'Spree::Promotion::Actions::RewardUser')
      end.compact.first
    end

    def create_reward
      Spree::ReferralProgramReward::Create.new(
        @order,
        referrer,
        amount
      ).call
    end

    def amount
      (@order.item_total * percent_of_commission / 100).round(2)
    end

    def percent_of_commission
      reward_user_promotion_action.promotion_action_reward_user.percent_of_commission
    end
  end
end
