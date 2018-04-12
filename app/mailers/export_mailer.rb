class ExportMailer < ApplicationMailer
  default from: "root@verhoeven"

  def daily_export_email(message)
    attachments['log.csv'] = File.read('log.csv')

    @title = "#{(Time.now - 24.hours)..Time.now} - DAILY DATA EXPORT"
    @message = message
    @user = User.first
    mail(to: @user.email, subject: "#{@title}")


  end
end
