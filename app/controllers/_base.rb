module Maenporth
  class BaseController < Scorched::Controller
    # TODO add session middleware
    # middleware << proc do |app|
    #   use Rack::Session::Cookie, secret: ENV.fetch('SESSION_SECRET_KEY')
    # end

    VIEW_DIR = File.expand_path('../../views', __FILE__).freeze
    render_defaults[:dir] = VIEW_DIR
    render_defaults[:layout] = File.expand_path('layouts/application', VIEW_DIR).to_sym
    # TODO document - needed as by default something else left to serve files in production
    config[:static_dir] = 'public '
  end
end
