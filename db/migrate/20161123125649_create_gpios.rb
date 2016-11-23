class CreateGpios < ActiveRecord::Migration[5.0]
  def change
    drop_table :gpios if (table_exists? :gpios)
    create_table :gpios do |t|
      t.string :name
      t.integer :pin
      t.integer :gpio_number
      t.integer :of_type

      t.timestamps
    end
  end
end
