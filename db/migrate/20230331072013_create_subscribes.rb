class CreateSubscribes < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribes do |t|
      t.belongs_to :admin_subscription, foreign_key: { to_table: :subscriptions }
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
