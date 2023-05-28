class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.belongs_to :follower, type: :string, foreign_key: { to_table: :users }
      t.belongs_to :followed, type: :string, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
