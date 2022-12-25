class CreateOreComments < ActiveRecord::Migration[6.1]
  def change
    create_table :ore_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.string :ore_id

      t.timestamps
    end
  end
end
