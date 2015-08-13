module WWW
  module Admin
    class PropertiesController < BaseController
      # In the future this might make more sense to be relative to some admin root
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

      patch '/:id/sale-profile' do |id|
        # TODO test
        @property = Estate.fetch(id) do
          not_found
          halt
        end
        form = PropertySaleForm.new request.POST['property']
        @property.update form
        @property.save
        render :'edit-sale-profile'
      end

      patch '/:id/rent-profile' do |id|
        # TODO test
        @property = Estate.fetch(id) do
          not_found
          halt
        end
        form = PropertyRentForm.new request.POST['property']
        @property.update form
        @property.save
        render :'edit-rent-profile'
      end

      patch '/:id/status' do |id|
        # TODO test
        @property = Estate.fetch(id) do
          not_found
          halt
        end
        form = PropertyStatusForm.new request.POST['property']
        @property.update form
        redirect('/admin/properties')
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
end
