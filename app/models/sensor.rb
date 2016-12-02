class Sensor < ApplicationRecord
  has_one :setpoint

  validates :address, presence: true, uniqueness: true

end
