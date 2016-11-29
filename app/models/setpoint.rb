class Setpoint < ApplicationRecord
  has_one :gpio
  has_one :sensor

  validates :name, presence: true, uniqueness: true
  validates :value, presence: true

end
