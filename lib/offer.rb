require_relative './random_identifier'

module Offer
  # The property entity is represented by the unwrapped record
  def self.new(*args, &block)
    Record.new(*args, &block)
  end

  MissingProviderError = Class.new(StandardError)
  class Record < Sequel::Model(:offers)
    include RandomIdentifier
    many_to_one :activity, :class => :'Activity::Record', :key => :activity_id

    def initialize(*args, &block)
      super
      now = DateTime.now
      date_string = now.strftime('%d%m%y')
      random = (("a".."z").to_a + (0..9).to_a).sample(6).join
      providers_offer_prefix = activity.providers_offer_prefix
      providers_name = activity.providers_name
      raise MissingProviderError if providers_name.nil? || providers_name.empty? || providers_offer_prefix.nil? || providers_offer_prefix.empty?
      self.created_at = now
      self.code = "#{providers_offer_prefix}-#{date_string}-#{random}"
    end

    def redeem_for(pence)
      self.transaction_value = pence
      self.redeemed_at = DateTime.now
      save
    end

    def transaction_value_string
      in_pennies = self.transaction_value
      return nil if in_pennies.nil?
      pence = in_pennies % 100
      pounds = in_pennies / 100
      "£#{pounds}.#{"%02d" % pence}"
    end
  end
end
