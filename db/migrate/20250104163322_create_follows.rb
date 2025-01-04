class CreateFollows < ActiveRecord::Migration[7.2]
  def change
    create_table :follows do |t|
      t.references :follower, null: false, foreign_key: { to_table: :users }
      t.references :following_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
