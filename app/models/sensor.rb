class Sensor < ApplicationRecord
  validates :address, presence: true, uniqueness: true
  validates :location, presence: true, uniqueness: true
end
