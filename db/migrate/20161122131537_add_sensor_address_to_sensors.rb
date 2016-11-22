class AddSensorAddressToSensors < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :address, :string
  end
end
