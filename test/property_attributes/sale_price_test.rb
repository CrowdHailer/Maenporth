require_relative '../test_config'

class SalePriceTest < MiniTest::Test
  def raw_sale_price
    120_000
  end

  def sale_price
    @sale_price ||= SalePrice.new raw_sale_price
  end

  def teardown
    @sale_price = nil
  end

  def test_initializes_from_pounds
    assert_equal raw_sale_price, sale_price.pounds
  end

  def test_initializes_from_string_of_pounds
    assert_equal raw_sale_price, SalePrice.new(raw_sale_price.to_s).pounds
  end

  def test_formats_with_gbp_symbol
    assert_match %r(^£), sale_price.to_s
  end

  def test_uses_thousands_separator
    assert_match %r(,000.00$), sale_price.to_s
  end

  def test_equal_for_same_values
    copy = SalePrice.new raw_sale_price
    assert_equal sale_price, copy
  end

end
