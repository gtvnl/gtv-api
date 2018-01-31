# Learn more: http://github.com/javan/whenever
job_type :runner,  "cd :path && :environment_variable=:environment /home/pi/.rbenv/shims/bundle exec bin/rails runner -e :environment ':task' :output"

every 1.day, :at => '12:00 am' do
  runner "DailyExportJob.perform_now"
end

every 5.minutes do
  runner "UpdateSensorsJob.perform_now"
  runner "CheckSetpointsJob.perform_now"
end

every 1.minute do
  command "/usr/bin/python /home/pi/gtv-api/log.py"
end
