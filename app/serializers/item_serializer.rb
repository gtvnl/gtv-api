
class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :created_at
  link(:self) { api_v1_item_url(object) }

end
