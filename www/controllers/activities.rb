module WWW
  class ActivitiesController < BaseController
    # DEBT to me named leisure controller
    render_defaults[:dir] += '/leisure'

    get "/" do
      render :categories
    end

    get "/category/:category" do |category_string|
      @category = Activity::Category.all.find { |c| c.name.downcase == category_string }
      @activities = Activity.send("#{@category.name.downcase}_activities")
      render :category
    end

    get "/redeem-offer" do
      render :redeem_offer
    end
    post "/redeem-offer" do
      code = request.POST["offer_code"]
      puts code
      code
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
        offer = Offer.new(
          :customer_name => request.POST["customer_name"],
          :customer_email_address => request.POST["customer_email_address"],
          :activity => activity
        ).save
        redirect "/leisure/offers/#{offer.id}"
      else
        response.status = 404
      end
    end

    get "/offers/:id" do |id|
      offer = Offer::Record.find(id: id)
      if offer
        @offer = offer
        render :show_offer
      else
        response.status = 404
      end
    end

  end
end
