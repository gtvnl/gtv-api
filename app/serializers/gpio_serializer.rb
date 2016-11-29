class GpioSerializer < ActiveModel::Serializer
  attributes :name, :pin, :gpio_number, :of_type
  has_one :setpoint

end
