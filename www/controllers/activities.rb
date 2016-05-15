module WWW
  class ActivitiesController < BaseController
    render_defaults[:dir] += '/activities'

    get "/all-categories" do
      "TODO make categories page"
    end

    get "/:id" do
      # Item should return if it has a provider and this sets the view
    end

    # Get index with activity chosen
    # /?category=discover
    # redirect to all category page if not found
  end
end
