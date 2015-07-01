module Maenporth
  class PropertiesController < BaseController
    render_defaults[:dir] += '/properties'

    get '/' do
      @properties = Estate.all
      render :index
    end

    get '/new' do
      # Might want to be 'new in future'
      @property = Property::Record.create
      render :edit
    end

    get '/for-rent' do
      render :'all-for-rent'
    end

    get '/for-sale' do
      # TODO filter
      @properties = Estate.all
      render :'all-for-sale'
    end

    get '/:id/edit' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :edit
    end

    patch '/:id' do |id|
      # TODO test
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      form = PropertyForm.new request.POST['property']
      ap request.POST
      @property.update form
      render :edit
    end

    get '/1/for-rent' do
      render :'for-rent'
    end

    get '/:id/for-sale' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :'for-sale'
    end

    get '/1/enquire' do
      render :enquire
    end

    delete '/:id' do |id|
      piece = Estate.fetch(id) do
        not_found
        halt
      end
      piece.destroy
      redirect '/pieces'
    end

    def not_found
      response.status = 404
    end

  end
end
