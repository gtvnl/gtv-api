class ChartsController < ApplicationController
  include AbstractController::Helpers
  include ActionController::Flash
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionView::Layouts

  layout 'chart'



  def index
    @sensor_1a = Log.where(sensor: "1a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_1b = Log.where(sensor: "1b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_1c = Log.where(sensor: "1c").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }

    @sensor_2a = Log.where(sensor: "2a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_2b = Log.where(sensor: "2b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_2c = Log.where(sensor: "2c").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }

    @sensor_3a = Log.where(sensor: "3a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_3b = Log.where(sensor: "3b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_3c = Log.where(sensor: "3c").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }

    @sensor_4a = Log.where(sensor: "4a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_4b = Log.where(sensor: "4b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_4c = Log.where(sensor: "4c").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }

    @sensor_5a = Log.where(sensor: "5a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_5b = Log.where(sensor: "5b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_5c = Log.where(sensor: "5c").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }

    @sensor_6a = Log.where(sensor: "6a").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_6b = Log.where(sensor: "6b").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }
    @sensor_6c = Log.where(sensor: "6c").where(updated_at: (Time.now - 24.hours)..Time.now).inject({}){|h,e| h.merge(e.created_at => e.value) }

    @setpoint1 = Setpoint.find_by(name: "Setpoint 1").value
    @setpoint2 = Setpoint.find_by(name: "Setpoint 2").value
    @setpoint3 = Setpoint.find_by(name: "Setpoint 3").value
    @setpoint4 = Setpoint.find_by(name: "Setpoint 4").value
    @setpoint5 = Setpoint.find_by(name: "Setpoint 5").value
    @setpoint6 = Setpoint.find_by(name: "Setpoint 6").value

    @data = [
      {name: "Sensor 1a", data: @sensor_1a},
      {name: "Sensor 1b", data: @sensor_1b},
      {name: "Sensor 1c", data: @sensor_1c},

      {name: "Sensor 2a", data: @sensor_2a},
      {name: "Sensor 2b", data: @sensor_2b},
      {name: "Sensor 2c", data: @sensor_2c},

      {name: "Sensor 3a", data: @sensor_3a},
      {name: "Sensor 3b", data: @sensor_3b},
      {name: "Sensor 3c", data: @sensor_3c},

      {name: "Sensor 4a", data: @sensor_4a},
      {name: "Sensor 4b", data: @sensor_4b},
      {name: "Sensor 4c", data: @sensor_4c},

      {name: "Sensor 5a", data: @sensor_5a},
      {name: "Sensor 5b", data: @sensor_5b},
      {name: "Sensor 5c", data: @sensor_5c},

      {name: "Sensor 6a", data: @sensor_6a},
      {name: "Sensor 6b", data: @sensor_6b},
      {name: "Sensor 6c", data: @sensor_6c}
    ]

    render "charts/index"

  end
end
