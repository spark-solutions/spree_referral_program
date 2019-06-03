module Spree
  class ReferralProgramReward::Create
    def initialize(order, user, amount)
      @order = order
      @user = user
      @amount = amount
    end

    def call
      reward = ReferralProgramReward.create!(
        order: @order,
        user: @user,
        amount: @amount
      )
      notify_user(reward)
      notify_admin(reward)
    end

    private

    def notify_user(reward)
      if ENV['ENABLE_REFERRAL_PROGRAM_USER_EMAIL_NOTIFICATION'] == 'true'
        Spree::ReferralProgramMailer.notify_referrer_email(reward).deliver_later
      end
    end

    def notify_admin(reward)
      if ENV['ENABLE_REFERRAL_PROGRAM_ADMIN_EMAIL_NOTIFICATION'] == 'true'
        Spree::ReferralProgramMailer.notify_admin_email(reward).deliver_later
      end
    end
  end
end
