class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :company, foreign_key: true
      t.string :name, null:false
      t.text :description
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
