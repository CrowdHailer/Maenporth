require_relative './random_identifier'

module Offer
  # The property entity is represented by the unwrapped record
  def self.new(*args, &block)
    Record.new(*args, &block)
  end

  class Record < Sequel::Model(:offers)
    include RandomIdentifier
    many_to_one :activity, :class => :'Activity::Record', :key => :activity_id

    def initialize(*args, &block)
      super
      self.created_at = DateTime.now
      random = (("a".."z").to_a + (0..9).to_a).sample(6).join
      self.code = "#{activity.providers_offer_prefix}-#{self.created_at.strftime('%d%m%y')}-#{random}"
    end

    def redeem_for(pence)
      self.transaction_value = pence
      self.redeemed_at = DateTime.now
      save
    end
  end
end
