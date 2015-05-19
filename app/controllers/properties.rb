module Maenporth
  class PropertiesController < BaseController
    render_defaults[:dir] += '/properties'

    get '/' do
      render :index
    end

  end
end
