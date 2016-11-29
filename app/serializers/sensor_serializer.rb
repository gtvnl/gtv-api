class SensorSerializer < ActiveModel::Serializer
  attributes :name, :value, :address, :location

  has_one :setpoint
end
