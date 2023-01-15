class CreateStoneComments < ActiveRecord::Migration[6.1]
  def change
    create_table :stone_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :ranking_id

      t.timestamps
    end
  end
end
