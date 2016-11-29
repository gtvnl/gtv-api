class AddGpioToSetpoints < ActiveRecord::Migration[5.0]
  def change
    add_reference :setpoints, :gpio, foreign_key: true
  end
end
