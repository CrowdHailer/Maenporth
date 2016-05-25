module WWW
  class PropertiesController < BaseController
    render_defaults[:dir] += '/properties'

    get '/for-rent' do
      @properties = Estate.for_rent.shuffle
      render :'all-for-rent'
    end

    get '/for-sale' do
      @properties = Estate.for_sale.shuffle
      render :'all-for-sale'
    end

    get '/:id/for-rent' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      # DEBT Belongs in View/Page object
      if @property.enquiry_route == 'agent'
        @enquiry_location =  @property.enquiry_link
      else
        @enquiry_location = "/properties/#{@property.id}/enquire"
      end
      render :'for-rent'
    end

    get '/:id/for-sale' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :'for-sale'
    end

    get '/:id/enquire' do |id|
      @property = Estate.fetch(id) do
        not_found
        halt
      end
      render :enquire
    end

    def not_found
      response.status = 404
    end

  end
end
