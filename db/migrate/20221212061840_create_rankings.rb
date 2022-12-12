class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :customer_id,          null: false, default: ""
      t.string :ore,                   null: false, default: ""
      t.string :type,                  null: false, default: ""
      t.string :name,                  null: false, default: ""
      t.integer :amount,               null: false, default: ""
      t.integer :rank,                 null: false, default: ""
      t.integer :status,               null: false, default: "0"
      t.timestamps
    end
  end
end
