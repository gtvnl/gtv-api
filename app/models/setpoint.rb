class Setpoint < ApplicationRecord
  has_one :gpio
  belongs_to :sensor

  validates :name, presence: true, uniqueness: true
  validates :value, presence: true

end
