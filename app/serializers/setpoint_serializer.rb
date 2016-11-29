class SetpointSerializer < ActiveModel::Serializer
  attributes :name, :value,

  belongs_to :gpio
  belongs_to :sensor
end
