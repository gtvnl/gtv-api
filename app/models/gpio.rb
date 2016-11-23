class Gpio < ApplicationRecord
  validates :gpio, presence: true, uniqueness: true
  validates :pin, presence: true, uniqueness: true
end
