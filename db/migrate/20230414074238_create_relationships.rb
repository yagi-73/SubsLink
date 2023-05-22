class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.belongs_to :follower, type: :uuid, foreign_key: { to_table: :users }
      t.belongs_to :followed, type: :uuid, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
