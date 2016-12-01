# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
job_type :runner,  "cd :path && /home/pi/.rbenv/shims/bundle exec bin/rails runner -e :environment ':task' :output"

every 1.day, :at => '12:00 am' do
  runner "DailyExportJob.perform_now"
end

every 5.minutes do
  runner "UpdateSensorsJob.perform_now"
end

every 1.minute do
  command "/home/pi/create_webserver_tunnel.sh 2>&1"
  command "/home/pi/create_ssh_tunnel.sh 2>&1"
  runner "CheckSetpointsJob.perform_now"
end
