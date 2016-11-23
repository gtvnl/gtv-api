class Sensor < ApplicationRecord
  validates :address, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
end
