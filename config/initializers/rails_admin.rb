
require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminLinks
end
module RailsAdminGraphs
end

module RailsAdmin
  module Config
    module Actions
      class Links < RailsAdmin::Config::Actions::Base
       RailsAdmin::Config::Actions.register(self)
        register_instance_option :object_level do
          true
        end
        register_instance_option :link_icon do
         'icon-circle'
        end
        register_instance_option :root? do
          true
        end
      end
      class Graphs < RailsAdmin::Config::Actions::Base
       RailsAdmin::Config::Actions.register(self)
        register_instance_option :object_level do
          true
        end
        register_instance_option :link_icon do
         'icon-bar-chart'
        end
        register_instance_option :root? do
          true
        end
      end
    end
  end
end


RailsAdmin.config do |config|
  config.main_app_name = ["Verhoeven"]
  config.parent_controller = '::RailsAdminCustomController'


  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
#   config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
#   config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    #show_in_app
    links
    # graphs


 config.excluded_models << User


  config.model 'Setpoint' do
      exclude_fields :id, :created_at, :updated_at
  end

  config.model 'Gpio' do
      exclude_fields :id, :created_at, :updated_at, :pin, :gpio_number
  end

  config.model 'Sensor' do
      exclude_fields :id, :created_at
  end

  config.model 'Log' do
      exclude_fields :id, :updated_at
      # show items per page
      list do
        items_per_page 100
      end
  end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
