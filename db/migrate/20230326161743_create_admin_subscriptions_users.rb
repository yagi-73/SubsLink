class CreateAdminSubscriptionsUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_subscriptions_users do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :admin_subscription, foreign_key: true

      t.timestamps
    end
  end
end
