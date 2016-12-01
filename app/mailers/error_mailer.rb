class ErrorMailer < ApplicationMailer
 default from: "gtv.21602040@gmail.com"

  def test_email(user)
    @user = User.first
    mail(to: @user.email, subject: 'Sample Email')
  end
end
