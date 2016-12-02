class CheckPowerSupplyMailer < ApplicationMailer
  default from: "gtv.21602040@gmail.com"


   def check_power_supply(title, body)
     @message = body
     @user = User.first
     mail(to: @user.email, subject: title)

     Log.create(description: "Email sent: #{@user.email}, subject: #{title}")

   end
end
