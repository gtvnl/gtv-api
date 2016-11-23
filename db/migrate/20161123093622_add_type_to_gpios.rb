class AddTypeToGpios < ActiveRecord::Migration[5.0]
  def change
    add_column :gpios, :of_type, :integer
  end
end
