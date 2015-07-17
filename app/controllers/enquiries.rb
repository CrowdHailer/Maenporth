module Maenporth
  class EnquiriesController < BaseController
    render_defaults[:dir] += '/enquiries'

    post '/' do
      ap request.POST
      # create enquirey
      render :create
    end


  end
end
