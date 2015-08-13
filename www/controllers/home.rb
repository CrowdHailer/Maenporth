module WWW
  class HomeController < BaseController
    render_defaults[:dir] += '/home'

    get '/' do
      render :index
    end

    get '/test-error' do
      raise TestError, 'This is a drill'
    end

  end
end
