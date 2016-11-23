class Setpoint < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :value, presence: true
end
