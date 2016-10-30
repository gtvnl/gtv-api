# app/controllers/home_controller.rb
class HomeController < ApplicationController

  def index
    render json: { "links": {
      "items":"http://localhost:3000/api/v1/items",
      "sensors":"http://localhost:3000/api/v1/sensors" }
                  }
  end

end
