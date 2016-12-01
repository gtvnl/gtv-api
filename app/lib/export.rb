require 'csv'
require 'google_drive'

class Export
	class << self
		def to_csv
			@logs = Log.where(updated_at: (Time.now - 24.hours)..Time.now)
			CSV.open("log.csv", "w") do |csv|
				csv << ["CreatedAt","Description","Sensor","Value"]
				@logs.each do |log|
					csv << [log.created_at, log.description, log.sensor, log.value]
				end
			end
		end

session = GoogleDrive::Session.from_config("config.json")
session.upload_from_file("log.csv", convert: true)

	end
end
