class CreateSpreeReferralProgramReward < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_referral_program_rewards do |t|
      t.integer :user_id
      t.integer :order_id
      t.decimal :amount, precision: 8, scale: 2, default: 0.0, null: false

      t.timestamps null: false
    end
    add_index :spree_referral_program_rewards, :user_id
    add_index :spree_referral_program_rewards, :order_id
  end
end
