require_relative '../test_config'

class EstateTest < MiniTest::Test
  include DatabaseTesting

  def test_can_create_property
    record = Estate.create
    assert record.id
  end

  def test_can_filter_for_rent
    for_rent_record = Estate.create :for_rent => true
    for_sale_record = Estate.create :for_sale => true
    all_for_rent = Estate.for_rent
    assert_equal 1, all_for_rent.count
  end

  def test_can_filter_for_sale
    for_rent_record = Estate.create :for_rent => true
    for_sale_record = Estate.create :for_sale => true
    all_for_rent = Estate.for_sale
    assert_equal 1, all_for_rent.count
  end
end
