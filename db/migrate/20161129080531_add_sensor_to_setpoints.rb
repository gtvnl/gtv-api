class AddSensorToSetpoints < ActiveRecord::Migration[5.0]
  def change
    add_reference :setpoints, :sensor, foreign_key: true
  end
end
