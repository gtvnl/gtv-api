class ApplicationMailer < ActionMailer::Base
  default from: "root@verhoeven"
  layout 'mailer'

  def send_email(title, body)
    @message = body
    @user = User.first
    mail(to: @user.email, subject: title)
  end
end
