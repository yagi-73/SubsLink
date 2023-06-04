class CreateRecommendedUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :recommended_users do |t|
      t.belongs_to :subject_user, type: :string, foreign_key: { to_table: :users }
      t.belongs_to :recommended_user, type: :string, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
