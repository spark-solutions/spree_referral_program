Spree::Order.class_eval do
  state_machine do
    after_transition to: :complete do |order|
      Spree::ReferralProgramReward::ProcessOrder.new(order).call
    end
  end
end
