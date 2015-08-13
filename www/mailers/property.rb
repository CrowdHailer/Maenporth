# TODO untested
class PropertyMailer
  def initialize(property)
    @property = property
  end

  attr_reader :property

  def enquiry(data)
    to = property.enquiry_email
    cc = ENV['ADMIN_EMAIL']
    from = 'no-reply@maenporthestate.com'

    prospect_name = data['name']
    prospect_email_address = data['email']
    prospect_telephone_number = data['telephone']
    prospect_prefered_dates = data['dates']
    prospect_message = data['message']

    file_path = File.expand_path('../property/enquiry.txt.erb', __FILE__)
    template = ERB.new File.read(file_path)

    text_body = template.result binding

    mail = Mail.new
    mail.from from
    mail.to to
    mail.cc cc

    # text_part = Mail::Part.new do
    #   body text_body
    # end
    # mail.text_part = text_part
    mail.body = text_body

    mail.deliver

  end
end
