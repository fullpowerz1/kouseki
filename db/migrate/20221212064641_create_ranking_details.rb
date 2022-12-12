class CreateRankingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :ranking_details do |t|
      t.integer :ranking_id,                   null: false, default: ""
      t.integer :ore_id,                       null: false, default: ""
      t.integer :amount,                       null: false, default: ""
      t.integer :rank,                         null: false, default: ""
      t.timestamps
    end
  end
end
