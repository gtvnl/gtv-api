class ErrorMailer < ApplicationMailer
 default from: "root@verhoeven"


  def error_email(title, body)
    @message = body
    @user = User.first
    mail(to: @user.email, subject: title)

  end
end
