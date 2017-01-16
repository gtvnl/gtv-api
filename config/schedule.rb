# Learn more: http://github.com/javan/whenever
job_type :runner,  "cd :path && /home/pi/.rbenv/shims/bundle exec bin/rails runner -e :environment ':task' :output"

every 1.day, :at => '12:00 am' do
  runner "DailyExportJob.perform_now"
end

every 5.minutes do
  command "/usr/bin/python /home/pi/gtv-api/log.py"
  runner "UpdateSensorsJob.perform_now"
  runner "CheckSetpointsJob.perform_now"
  runner "CheckPowerSupplyJob.perform_now"
end

every 1.minute do
  command "/home/pi/gtv-api/create_webserver_tunnel.sh 2>&1"
  command "/home/pi/gtv-api/create_ssh_tunnel.sh 2>&1"
end
