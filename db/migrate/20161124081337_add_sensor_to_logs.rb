class AddSensorToLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :logs, :sensor, :string
  end
end
