module WWW
  module Admin
    class ActivitiesController < BaseController
      # In the future this might make more sense to be relative to some admin root
      render_defaults[:dir] += '/admin/activities'

      get '/' do
        @activities = Activity::Record.all
        render :index
      end

      get '/new' do
        @activity = Activity::Record.create
        render :edit
      end

      post '/' do
        # DEBT not used
        activity = Activity::Record.create(request.POST)
        redirect "/#{activity.id}"
      end

      get '/:id/edit' do |id|
        @activity = Activity::Record.find(id: id)
        if @activity
          render :edit
        else
          not_found
        end
      end

      patch '/:id' do |id|
        @activity = Activity::Record.find(id: id)
        if @activity
          updates = request.POST.clone
          updates.delete("_method") # Mutable Eurgh DEBT
          @activity.update(updates)
          redirect '/admin/activities'
          # Probably redirect somewhere
        else
          not_found
        end
      end

      delete '/:id' do |id|
        activity = Activity::Record.find(id: id)
        if activity
          activity.destroy
          redirect '/admin/activities'
        else
          not_found
        end
      end

      def not_found
        response.status = 404
      end
    end
  end
end
