class CreateCustomerAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_addresses do |t|
      t.integer     :ship_area_id,  null: false
      t.string      :post_code,     null: false
      t.string      :city
      t.string      :block
      t.string      :building
      t.string      :phone_number
      t.references  :purchase_history,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
