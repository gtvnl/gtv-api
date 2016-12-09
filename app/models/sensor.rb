class Sensor < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  has_one :setpoint


end
