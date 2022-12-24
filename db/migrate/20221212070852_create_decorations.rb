class CreateDecorations < ActiveRecord::Migration[6.1]
  def change
    create_table :decorations do |t|
      t.integer :customer_id,         null: false, default: ""
      t.string :ore,                  null: false, default: ""
      t.string :amulet,                 null: false, default: ""
      t.string :nickname,             null: false, default: ""
      t.timestamps
    end
  end
end
