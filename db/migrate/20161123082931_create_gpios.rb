class CreateGpios < ActiveRecord::Migration[5.0]
  def change
    create_table :gpios do |t|
      t.string :name
      t.integer :gpio
      t.integer :pin

      t.timestamps
    end
  end
end
