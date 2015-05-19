module Maenporth
  class HomeController < BaseController
    render_defaults[:dir] += '/home'

    get '/' do
      render :index
    end

  end
end
