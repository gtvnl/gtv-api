class SwitchController < ApplicationController
  def switch
    relais =  "Relais " + request.params[:format]
    gpio = Gpio.find_by(name: relais)
    puts gpio.name
  end
  def all_on
    Relais.all_on
  end
  def all_off
    Relais.all_off
  end
end
