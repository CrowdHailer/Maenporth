module WWW
  module Admin
    class ActivitiesController < BaseController
      # In the future this might make more sense to be relative to some admin root
      render_defaults[:dir] += '/admin/activities'

      get '/' do
        # TODO list
        @activities = []
        render :index
      end

      get '/new' do
        @activity = {}
        render :edit
      end

      get '/:id/edit' do |id|
        # @activity = Estate.fetch(id) do
          not_found
          halt
        # end
        render :edit
      end

      patch '/:id' do |id|
        # @property = Estate.fetch(id) do
        #   not_found
        #   halt
        # end
        # form = PropertySaleForm.new request.POST['property']
        # @property.update form
        # @property.save
        render :'edit'
      end

      delete '/:id' do |id|
        # piece = Estate.fetch(id) do
        #   not_found
        #   halt
        # end
        piece.destroy
        redirect '/admin/activities'
      end

      def not_found
        response.status = 404
      end
    end
  end
end
