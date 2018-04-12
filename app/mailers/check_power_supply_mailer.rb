class CheckPowerSupplyMailer < ApplicationMailer
  default from: "root@verhoeven"

   def check_power_supply(title, body)
     @message = body
     @user = User.first
     mail(to: @user.email, subject: title)

   end
end
