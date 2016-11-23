class Log < ApplicationRecord
  validates :description, presence: true
end
