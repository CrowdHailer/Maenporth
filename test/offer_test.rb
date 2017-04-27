require_relative './test_config'

class OfferTest < MiniTest::Test
  include DatabaseTesting

  def test_created_offer_has_code_and_id
    activity_record = Activity::Record.create(
      :category => "Discover",
      :activity_name => "Climbing",
      :providers_name => "Bobs outings",
      :providers_offer_prefix => "BOB"
    )

    record = Offer.new(
    :customer_name => "Mike",
    :customer_email_address => "mike@lovit.org",
    :activity => activity_record
    ).save

    assert record.id

    # DEBT hard coded check for the year
    assert_match /^BOB-\d{4}17-/, record.code

    # Asserts that associated activity is also saved
    assert activity_record.id
  end

  def test_cant_create_offer_if_no_provider
    activity_record = Activity::Record.create(
      :category => "Discover",
      :activity_name => "Walking"
    )

    assert_raises Offer::MissingProviderError do
      record = Offer.new(
      :customer_name => "Mike",
      :customer_email_address => "mike@lovit.org",
      :activity => activity_record
      ).save
    end
  end

  def test_check_redeem_action
    activity_record = Activity::Record.create(
      :category => "Discover",
      :activity_name => "Climbing",
      :providers_name => "Bobs outings",
      :providers_offer_prefix => "BOB"
    )

    record = Offer.new(
    :customer_name => "Mike",
    :customer_email_address => "mike@lovit.org",
    :activity => activity_record
    ).save

    record.redeem_for(2000) # £20.00 FIXME use money
    assert record.redeemed_at
    assert 2000, record.transaction_value
  end
end
