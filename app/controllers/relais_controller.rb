class GpiosController < ApplicationController
    before_action :authenticate_request
    
    def switch_relais
        binding.pry
    end
end
  