class RemovePinFromGpios < ActiveRecord::Migration[5.0]
  def change
    remove_column :gpios, :pin
  end
end
