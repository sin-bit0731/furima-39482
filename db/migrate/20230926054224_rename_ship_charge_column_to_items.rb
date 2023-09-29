class RenameShipChargeColumnToItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :ship_charge, :ship_charge_id
  end
end
