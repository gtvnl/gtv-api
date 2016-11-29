class AddPinToSetpoint < ActiveRecord::Migration[5.0]
  def change
    add_column :setpoints, :pin, :integer
  end
end
