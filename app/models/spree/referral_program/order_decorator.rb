module Spree
  module ReferralProgram
    module OrderDecorator
      def self.prepended(base)
        base.state_machine.after_transition to: :complete do |order|
          Spree::ReferralProgramReward::ProcessOrder.new(order).call
        end
      end
    end
  end
end

Spree::Order.prepend(Spree::ReferralProgram::OrderDecorator)
