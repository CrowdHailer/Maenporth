Dir[File.expand_path('../admin/*.rb', __FILE__)].each { |file| require file}

module WWW
  class AdminController < BaseController
    middleware << proc do |app|
      use Rack::Auth::Basic do |username, password|
        username == ENV.fetch('ADMIN_USERNAME') && password == ENV.fetch('ADMIN_PASSWORD')
      end
    end

    controller '/properties', Admin::PropertiesController
    controller '/activities', Admin::ActivitiesController

    get '/' do
      'on the admin page'
    end
  end
end
