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
      render :'edit-sale-profile'
    end

    get '/for-rent' do
      @properties = Estate.for_rent
      render :'all-for-rent'
    end

    get '/for-sale' do
      @properties = Estate.for_sale
      render :'all-for-sale'
    end

    get '/:id/edit-sale-profile' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :'edit-sale-profile'
    end

    get '/:id/edit-rent-profile' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :'edit-rent-profile'
    end

    patch '/:id' do |id|
      # TODO test
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      form = PropertyForm.new request.POST['property']
      @property.update form
      render :'edit-sale-profile'
    end

    patch '/:id/status' do |id|
      # TODO test
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      form = PropertyStatusForm.new request.POST['property']
      @property.update form
      redirect('/properties')
    end

    get '/:id/for-rent' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :'for-rent'
    end

    get '/:id/for-sale' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :'for-sale'
    end

    get '/:id/enquire' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :enquire
    end

    delete '/:id' do |id|
      piece = Estate.fetch(id) do
        not_found
        halt
      end
      piece.destroy
      redirect '/properties'
    end

    def not_found
      response.status = 404
    end

  end
end
