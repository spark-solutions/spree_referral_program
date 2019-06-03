class CreateSpreePromotionActionRewardUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :spree_promotion_action_reward_users do |t|
      t.integer :promotion_action_id
      t.integer :user_id
      t.integer :percent_of_commission, default: 10, null: false

      t.timestamps null: false
    end
    add_index :spree_promotion_action_reward_users, :promotion_action_id, name: :index_spree_promotion_action_reward_users_on_action_id
    add_index :spree_promotion_action_reward_users, :user_id
  end
end
