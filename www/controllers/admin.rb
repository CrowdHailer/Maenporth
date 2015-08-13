module WWW
  class AdminController < BaseController
    middleware << proc do |app|
      use Rack::Auth::Basic do |username, password|
        username == ENV.fetch('ADMIN_USERNAME') && password == ENV.fetch('ADMIN_PASSWORD')
      end
    end

    get '/' do
      'on the admin page'
    end
  end
end
