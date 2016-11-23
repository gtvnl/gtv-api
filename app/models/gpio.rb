class Gpio < ApplicationRecord
  enum of_type: [:output, :input]

  validates :gpio, presence: true, uniqueness: true
  validates :pin, presence: true, uniqueness: true
  validates :of_type, presence: true

end
