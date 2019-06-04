namespace :referral_program do
  desc 'Sends daily referral program rewards report'
  task send_daily_report: :environment do
    scope = Spree::ReferralProgramReward.where(created_at: 1.day.ago.all_day)
    Spree::ReferralProgramMailer.report_email(scope, 'daily').deliver_now
  end

  task send_weekly_report: :environment do
    scope = Spree::ReferralProgramReward.where(created_at: 1.week.ago.all_week)
    Spree::ReferralProgramMailer.report_email(scope, 'weekly').deliver_now
  end

  task send_monthly_report: :environment do
    scope = Spree::ReferralProgramReward.where(created_at: 1.month.ago.all_month)
    Spree::ReferralProgramMailer.report_email(scope, 'monthly').deliver_now
  end
end
