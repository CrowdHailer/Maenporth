module WWW
  class ActivitiesController < BaseController
    render_defaults[:dir] += '/leisure'

    get "/" do
      render :categories
    end

    get "/category/:category" do |category_string|
      @category = Activity::Category.all.find { |c| c.name.downcase == category_string }
      @activities = Activity.send("#{@category.name.downcase}_activities")
      render :category
    end

    # FIXME route under activities
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

    post "/activities/:id/generate-offer" do |id|
      activity = Activity::Record.find(id: id)
      if activity
        redirect "/leisure/offers/123"
      else
        response.status = 404
      end
    end

    get "/offers/:id" do |id|
      render :show_offer
    end
  end
end
