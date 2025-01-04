class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: { to_table: :posts }
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.string :content

      t.timestamps
    end
  end
end
