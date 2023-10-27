class RemoveShipMethodIdFromItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :ship_method_id, :integer
  end
end
