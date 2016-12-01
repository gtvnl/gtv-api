class AddMaxTempDifferenceToSetpoints < ActiveRecord::Migration[5.0]
  def change
    add_column :setpoints, :max_temp_difference, :float, default: 0.0
  end
end
