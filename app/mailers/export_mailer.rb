class ExportMailer < ApplicationMailer
  default from: "gtv.21602040@gmail.com"

  def daily_export_email(message)
    attachments['log.csv'] = File.read('log.csv')
    
    @title = "#{(Time.now - 24.hours)..Time.now} - DAILY DATA EXPORT"
    @message = message
    @user = User.first
    mail(to: @user.email, subject: "#{@title}")

    Log.create(description: "Email sent: #{@user.email}, subject: #{@title}")

  end
end
