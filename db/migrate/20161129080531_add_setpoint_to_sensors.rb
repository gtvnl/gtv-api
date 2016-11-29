class AddSetpointToSensors < ActiveRecord::Migration[5.0]
  def change
    add_reference :sensors, :setpoint, foreign_key: true
  end
end
