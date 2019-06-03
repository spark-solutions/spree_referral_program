module Spree
  class ReferralProgramReward::Create
    def initialize(order, user, amount)
      @order = order
      @user = user
      @amount = amount
    end

    def call
      ReferralProgramReward.create!(
        order: @order,
        user: @user,
        amount: @amount
      )
      puts 'notify admin'
      puts 'notify user'
    end
  end
end
