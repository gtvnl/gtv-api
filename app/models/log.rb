require 'csv'
class Log < ApplicationRecord
  default_scope { order(updated_at: :desc) }

  validates :description, presence: true

def make_hash
  h = Hash.new
  Log.where(sensor: "2b").pluck_h(:created_at, :value).each do |item|
    h.["#{item.created_at}"] = item.value
  end

  return h

end

def self.as_csv
  CSV.generate do |csv|
    csv << column_names
    all.each do |item|
      csv << item.attributes.values_at(*column_names)
    end
  end
end

end
