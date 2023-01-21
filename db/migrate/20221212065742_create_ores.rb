class CreateOres < ActiveRecord::Migration[6.1]
  def change
    create_table :ores do |t|
     t.integer :genre_id,              null: false
     t.string :stone,                    null: false, default: ""
     t.text :introduction,             null: false
     t.boolean :is_active,             null: false, default: true
      t.timestamps
    end
  end
end
