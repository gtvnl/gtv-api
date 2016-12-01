class ErrorMailer < ApplicationMailer
 default from: "gtv.21602040@gmail.com"

  def test_email(user)
    @user = User.first
    mail(to: @user.email, subject: 'Sample Email')
  end

  def error_email(title, body)
    @message = message
    @user = User.first
    mail(to: @user.email, subject: title)

    Log.create(description: "Email sent: #{@user.email}, subject: #{title}")

  end
end
