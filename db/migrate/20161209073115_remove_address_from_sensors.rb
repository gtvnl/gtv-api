class RemoveAddressFromSensors < ActiveRecord::Migration[5.0]
  def self.up
    remove_column :sensors, :address
  end

  def self.down
    add_column :sensors, :address, :string
  end
end
