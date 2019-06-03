module Spree
  class ReferralProgramMailer < BaseMailer
    def notify_referrer_email(referral_program_reward)
      @referral_program_reward = referral_program_reward.respond_to?(:id) ? referral_program_reward : Spree::ReferralProgramReward.find(referral_program_reward)
      subject = "#{Spree::Store.current.name} #{Spree.t('referral_program_mailer.notify_referrer_email.subject')}"
      mail(to: @referral_program_reward.user.email, from: from_address, subject: subject)
    end

    def notify_admin_email(referral_program_reward)
      admin_emails = ENV['REFERRAL_PROGRAM_ADMIN_EMAILS'].to_s.split(',').map(&:strip)
      return if admin_emails.empty?

      @referral_program_reward = referral_program_reward.respond_to?(:id) ? referral_program_reward : Spree::ReferralProgramReward.find(referral_program_reward)
      subject = "#{Spree::Store.current.name} #{Spree.t('referral_program_mailer.notify_admin_email.subject')}"
      mail(to: admin_emails, from: from_address, subject: subject)
    end
  end
end
