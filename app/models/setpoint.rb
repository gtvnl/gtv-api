class Setpoint < ApplicationRecord
  belongs_to :gpio, optional: true
  belongs_to :sensor, optional: true

  validates :name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  validates :value, presence: true

end
