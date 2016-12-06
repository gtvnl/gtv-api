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

    @data = [
  {name: "Sensor 2a", data: @sensor_2a},
  {name: "Sensor 2b", data: @sensor_2b}
]
    render "charts/index"

  end
end
