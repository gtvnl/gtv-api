class AddOperatingHoursToGpio < ActiveRecord::Migration[5.0]
  def change
    add_column :gpios, :operating_hours, :integer, :limit => 8
    add_column :gpios, :start_time, :datetime
    add_column :gpios, :end_time, :datetime    
  end
end
