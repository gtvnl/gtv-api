class RemovePinFromSetpoints < ActiveRecord::Migration[5.0]
  def change
    remove_column :setpoints, :pin
  end
end
