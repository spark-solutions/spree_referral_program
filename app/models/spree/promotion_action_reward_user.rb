module Spree
  class PromotionActionRewardUser < Spree::Base
    belongs_to :promotion_action, class_name: 'Spree::Promotion::Actions::RewardUser'
    belongs_to :user, class_name: 'Spree::User'
  end
end
