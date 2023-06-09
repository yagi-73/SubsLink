class CreateSubscribes < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribes do |t|
      t.belongs_to :admin_subscription, foreign_key: { to_table: :subscriptions }
      t.belongs_to :user, type: :string, foreign_key: true
      t.date :contract_day, null: false

      t.timestamps
    end
  end
end
