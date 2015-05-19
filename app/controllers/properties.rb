module Maenporth
  class PropertiesController < BaseController
    render_defaults[:dir] += '/properties'

    get '/' do
      render :index
    end

    get '/for-rent' do
      render :'all-for-rent'
    end

    get '/for-sale' do
      render :'all-for-sale'
    end

    get '/1/edit' do
      render :edit
    end

    get '/1/for-rent' do
      render :'for-rent'
    end

    get '/1/for-sale' do
      render :'for-sale'
    end

    get '/1/enquire' do
      render :enquire
    end

  end
end
