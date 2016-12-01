class DailyExportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Export.to_csv
    ExportMailer.daily_export_email("Hereby the data of the last 24 hours ...").deliver
  end
end
