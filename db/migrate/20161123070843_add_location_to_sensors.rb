class AddLocationToSensors < ActiveRecord::Migration[5.0]
  def change
    add_column :sensors, :location, :string
  end
end
