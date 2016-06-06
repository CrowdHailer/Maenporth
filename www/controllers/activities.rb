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
      offer = Offer::Record.where(code: code).first
      if offer.nil? || offer.redeemed_at
        response.status = 404
      else
        pounds = request.POST["transaction_value"].to_f
        pence = (pounds * 100).to_i
        offer.redeem_for(pence)
        "ALL good"
      end
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
          :customer_name => Rack::Utils.escape_html(request.POST["customer_name"]),
          :customer_email_address => Rack::Utils.escape_html(request.POST["customer_email_address"]),
          :activity => activity
        ).save
        email_offer_to_customer(offer)
        # EOFError: end of file reached
        # Caused by bad env variables for mail server
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

    def email_offer_to_customer(offer)
      file_path = File.expand_path('../activities/offer_email.txt.erb', __FILE__)
      template = ERB.new File.read(file_path)

      # This has offer available but also a bunch of other stuff
      text_body = template.result(binding)
      Mail.deliver do
        from     'no-reply@maenporthestate.com'
        to       offer.customer_email_address
        cc       [ENV['ADMIN_EMAIL']]
        subject  'Here is your offer'
        body     text_body
      end
    end

  end
end
