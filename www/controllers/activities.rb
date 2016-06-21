module WWW
  class ActivitiesController < BaseController
    # DEBT to me named leisure controller
    render_defaults[:dir] += '/leisure'

    get "/" do
      render :categories
    end

    get "/category/:category" do |category_string|
      @category = Activity::Category.all.find { |c| c.name.downcase == category_string }
      @activities = Activity.send("#{@category.name.downcase}_activities").reject(&:hidden?)
      render :category
    end

    get "/redeem-offer" do
      render :redeem_offer
    end
    post "/redeem-offer" do
      code = request.POST["offer_code"]
      offer = Offer::Record.where(code: code).first
      # DEBT should redirect on id should redirect to a failure page if already redeemed
      if offer.nil? || offer.redeemed_at
        redirect "/leisure/redeem-offer/#{Rack::Utils.escape_path(code)}"
      else
        pounds = request.POST["transaction_value"].to_f
        pence = (pounds * 100).to_i
        # DEBT redeem_for should check for single redemtion
        offer.redeem_for(pence)
        redirect "/leisure/redeem-offer/#{offer.id}"
      end
    end
    get "/redeem-offer/:offer_id" do |id|
      offer = Offer::Record.where(id: id).first
      # DEBT booleand redeemed?
      if offer && offer.redeemed_at
        @message = "This offer code is genuine. Thank you for submitting the transaction value."
        render :redeem_offer
      else
        @message = "This offer code has failed. If you have already submitted this offer code this may be the reason for the failure as you can only submit an offer code one.  You may have typed the offer code incorrectly, in this case please try again.  If you need help, contact Jessica: jessica.hodges@maenporthestate.co.uk"
        render :redeem_offer
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
        email_offer_to_provider(offer)
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
    def email_offer_to_provider(offer)
      file_path = File.expand_path('../activities/offer_email_to_provider.txt.erb', __FILE__)
      template = ERB.new File.read(file_path)

      # This has offer available but also a bunch of other stuff
      text_body = template.result(binding)
      Mail.deliver do
        from     'no-reply@maenporthestate.com'
        to       offer.activity.providers_email_address
        cc       [ENV['ADMIN_EMAIL']]
        subject  'Here is a new offer'
        body     text_body
      end
    end

  end
end
