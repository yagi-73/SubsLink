class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, type: :string,  foreign_key: true
      t.belongs_to :company,              foreign_key: true
      t.belongs_to :category,             foreign_key: true
      t.belongs_to :basic_subscription,   foreign_key: { to_table: :subscriptions }
      t.string :name, null:false
      t.string :catch_copy
      t.text :description
      t.integer :price, null: false
      t.date :contract_day
      t.integer :update_cycle, null: false
      t.string :type
      t.boolean :is_basic, null: false, default: true
      t.integer :subscribes_count, null: false, default: 0

      t.timestamps
    end
  end
end
