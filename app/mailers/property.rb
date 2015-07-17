class PropertyMailer
  def initialize(property)
    @property = property
  end

  attr_reader :property

  def enquiry(data)
    to = [property.enquiry_email, ENV['ADMIN_EMAIL']]
    from = 'info@etc.com'

    prospect_name = data['name']
    prospect_email_address = data['email']
    prospect_telephone_number = data['telephone']
    prospect_prefered_dates = data['dates']
    prospect_message = data['message']

    file_path = File.expand_path('../property/enquiry.txt.erb', __FILE__)
    template = ERB.new File.read(file_path)
    ap template.result binding
  end
end
