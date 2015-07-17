module MailerTesting
  def clear_mail
    require 'mail'
    Mail.defaults do
      delivery_method :test
    end
    Mail::TestMailer.deliveries.clear
  end

  def last_message
    @last_message ||= Mail::TestMailer.deliveries.pop
  end
end
