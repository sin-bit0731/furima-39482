class AddShipChargeToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :ship_charge, :integer
  end
end
