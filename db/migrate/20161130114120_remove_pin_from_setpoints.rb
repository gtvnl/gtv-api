class RemovePinFromSetpoints < ActiveRecord::Migration[5.0]
  def up
    remove_column :setpoints, :pin
  end

  def down
    add_column :setpoints, :pin, :integer
  end

end
