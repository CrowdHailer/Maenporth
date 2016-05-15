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

    get "/:id" do
      # Item should return if it has a provider and this sets the view
      "Stuff"
    end

  end
end
