require_relative './test_config'

class OfferTest < MiniTest::Test
  include DatabaseTesting

  # TODO not allowed if no provider
  def test_assert_has_id
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
    puts record.code
    # TODO check code generation
  end

  def test_check_redeem_action
    activity_record = Activity::Record.create(
      :category => "Discover",
      :activity_name => "Climbing"
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
