class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :description
      t.float :value

      t.timestamps
    end
  end
end
