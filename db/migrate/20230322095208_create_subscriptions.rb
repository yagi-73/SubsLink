class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, type: :string, foreign_key: true
      t.belongs_to :company, foreign_key: true
      t.belongs_to :group, foreign_key: true
      t.belongs_to :category, foreign_key: true
      t.string :name, null:false
      t.string :catch_copy
      t.text :description
      t.integer :price, null: false
      t.date :contract_day
      t.integer :update_cycle, null: false
      t.string :type
      t.integer :subscribes_count, null: false, default: 0

      t.timestamps
    end
  end
end
