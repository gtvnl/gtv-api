class Sensor < ApplicationRecord
  belongs_to :setpoint

  validates :address, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

end
