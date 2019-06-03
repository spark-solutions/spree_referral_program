module Spree
  class Promotion
    module Actions
      class RewardUser < PromotionAction
        has_one :promotion_action_reward_user, foreign_key: :promotion_action_id

        accepts_nested_attributes_for :promotion_action_reward_user

        before_create :build_promotion_action_reward_user

        def perform(payload = {})
          true
        end
      end
    end
  end
end
