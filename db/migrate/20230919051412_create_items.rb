class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name,        null: false
      t.text :description,        null: false
      t.integer :category_id
      t.integer :condition_id
      t.integer :ship_method_id
      t.integer :ship_area_id
      t.integer :ship_day_id
      t.integer :ship_charge_id
      t.integer :price,           null: false
      t.references :user,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
