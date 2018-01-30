class DropMetersTable < ActiveRecord::Migration[5.1]
  def up
    drop_table :meters
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
