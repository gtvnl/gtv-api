class Setpoint < ApplicationRecord
  belongs_to :gpio, optional: true
  belongs_to :sensor, optional: true

  validates :name, presence: true, uniqueness: true

  validates :gpio, uniqueness: true, allow_blank: true
  validates :sensor, uniqueness: true, allow_blank: true

  validates :value, presence: true

end
