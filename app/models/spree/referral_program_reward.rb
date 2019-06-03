module Spree
  class ReferralProgramReward < ActiveRecord::Base
    belongs_to :order
    belongs_to :user

    validates :amount, numericality: { greater_than_or_equal_to: 0.0 }
  end
end
