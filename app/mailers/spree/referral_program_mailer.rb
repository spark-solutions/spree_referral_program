module Spree
  class ReferralProgramMailer < BaseMailer
    helper Spree::Admin::BaseHelper
    def notify_referrer_email(referral_program_reward)
      @referral_program_reward = referral_program_reward.respond_to?(:id) ? referral_program_reward : Spree::ReferralProgramReward.find(referral_program_reward)
      subject = "[#{Spree::Store.current.name}] #{Spree.t('referral_program_mailer.notify_referrer_email.subject')}"
      mail(to: @referral_program_reward.user.email, from: from_address, subject: subject)
    end

    def notify_admin_email(referral_program_reward)
      return if admin_emails.empty?

      @referral_program_reward = referral_program_reward.respond_to?(:id) ? referral_program_reward : Spree::ReferralProgramReward.find(referral_program_reward)
      subject = "[#{Spree::Store.current.name}] #{Spree.t('referral_program_mailer.notify_admin_email.subject')}"
      mail(to: admin_emails, from: from_address, subject: subject)
    end

    def report_email(referral_program_rewards, scope_name)
      @referral_program_rewards = referral_program_rewards
      return if admin_emails.empty?

      subject = "[#{Spree::Store.current.name}] #{Spree.t('referral_program_mailer.report_email.subject')} - #{scope_name}"
      mail(to: admin_emails, from: from_address, subject: subject)
    end

    private

    def admin_emails
      @admin_emails ||= ENV['REFERRAL_PROGRAM_ADMIN_EMAILS'].to_s.split(',').map(&:strip)
    end
  end
end
