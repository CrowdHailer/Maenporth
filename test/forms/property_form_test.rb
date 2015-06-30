require_relative '../test_config'

class PropertyFormTest < Minitest::Test
  def test_obtains_sale_description
    raw = '# Hello'
    description = Description.new raw
    form = PropertyForm.new :sale_description => raw
    assert_equal description, form.sale_description
  end

  def test_obtains_sale_price
    raw = '120000'
    sale_price = SalePrice.new 120000
    form = PropertyForm.new :sale_price => raw
    assert_equal sale_price, form.sale_price
  end
end
