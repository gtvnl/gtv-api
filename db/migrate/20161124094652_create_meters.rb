class CreateMeters < ActiveRecord::Migration[5.0]
  def change
    create_table :meters do |t|
      t.string :name
      t.integer :value
      t.integer :gpio

      t.timestamps
    end
  end
end
