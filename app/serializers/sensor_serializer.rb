
class SensorSerializer < ActiveModel::Serializer
  attributes :id, :name, :value, :created_at
  link(:self) { api_v1_sensor_url(object) }

end
