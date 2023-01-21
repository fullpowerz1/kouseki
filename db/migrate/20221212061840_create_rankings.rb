class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :customer_id,          null: false
      t.integer :ore_id,                   null: false
      t.string :stone,                 null: false, default: ""
      t.string :amulet,                  null: false, default: ""
      t.string :name,                  null: false, default: ""
      t.integer :amount,               null: false
      t.integer :rank,                 null: false
      t.integer :status,               null: false, default: 0
      t.timestamps
    end
  end
end
