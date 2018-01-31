class SwitchController < ApplicationController
  def all_on
    Relais.all_on
  end
  def all_off
    Relais.all_off
  end
end
