class CreateRankingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ranking_details do |t|
      t.integer :ranking_id,                   null: false
      t.integer :ore_id,                       null: false
      t.integer :amount,                       null: false
      t.integer :rank,                         null: false
      t.timestamps
    end
  end
end
