class AddPinToMeter < ActiveRecord::Migration[5.0]
  def change
    add_column :meters, :pin, :integer
  end
end
