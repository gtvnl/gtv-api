class AddApikeyToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :apikey, :string
  end
end
