module Maenporth
  class EnquiriesController < BaseController
    render_defaults[:dir] += '/enquiries'

    post '/' do
      enquiry_data = request.POST['enquiry'];
      property = Estate.fetch(enquiry_data['property_id'])

      PropertyMailer.new(property).enquiry(enquiry_data)
      # create enquirey
      render :create
    end


  end
end
