class SwitchController < ApplicationController
  def switch
    if  request.params[:format]
      relais =  "Relais " + request.params[:format]
      gpio = Gpio.find_by(name: relais)
      if gpio.is_on?
        Relais.off(gpio.pin)
      else
        Relais.on(gpio.pin)
      end
    end
  end
  def all_on
    Relais.all_on
  end
  def all_off
    Relais.all_off
  end
end
