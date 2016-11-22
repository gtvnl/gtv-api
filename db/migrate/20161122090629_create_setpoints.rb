class CreateSetpoints < ActiveRecord::Migration[5.0]
  def change
    create_table :setpoints do |t|
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
