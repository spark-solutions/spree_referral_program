Spree.config do |config|
  Rails.application.config.spree.promotions.actions << Spree::Promotion::Actions::RewardUser
end
