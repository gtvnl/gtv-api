class AddSetpointValueToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :setpoint_value, :float
  end
end
