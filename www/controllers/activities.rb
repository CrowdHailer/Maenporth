module WWW
  class ActivitiesController < BaseController
    render_defaults[:dir] += '/activities'

    get "/all-categories" do
      render :categories
    end

    get "/category/:category" do |category|
      @category = Activity::Category.all.find{ |c| c.name.downcase == category }
      # TODO filter
      @activities = Activity::Record.all
      render :category
    end

    get "/:id" do |id|
      @activity = Activity::Record.find(id: id)
      if @activity
        if @activity.has_provider?
          render :show_with_provider
        else
          render :show_without_provider
        end
      else
        response.status = 404
      end
    end
  end
end
