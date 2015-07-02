require File.expand_path("../../config/boot.rb", __FILE__)

# Load all controllers
require File.expand_path('../controllers/_base.rb', __FILE__)
Dir[File.expand_path('../controllers/*.rb', __FILE__)].each { |file| require file}

def production?
  RACK_ENV == 'production'
end

module Maenporth
  class App < BaseController
    middleware << proc do |app|
      use Bugsnag::Rack
    end

    # Load further controllers before final root mounted controller
    controller '/properties', PropertiesController
    controller '/', HomeController

    after :status => 404 do
      response.body = render :'errors/404'
    end

    error do
      # TODO respond to staging
      if production?
        response.status = 500
        response.body = render :'errors/500'
      end
    end
  end
end
