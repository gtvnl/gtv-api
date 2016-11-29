class Setpoint < ApplicationRecord
  belongs_to :gpio
  belongs_to :sensor

  validates :name, presence: true, uniqueness: true
  validates :value, presence: true

end
