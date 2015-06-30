require_relative '../test_config'

class PropertyFormTest < Minitest::Test
  def test_obtains_property_name
    property_name = 'number 38'
    form = PropertyForm.new :property_name => property_name
    assert_equal property_name, form.property_name
  end

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

  def test_obtains_estate_agent_link
    link = 'link.example.com'
    form = PropertyForm.new :estate_agent_link => link
    assert_equal link, form.estate_agent_link
  end

  def test_obtains_property_type
    property_type = 'Flat'
    form = PropertyForm.new :property_type => property_type
    assert_equal property_type, form.property_type
  end

  def test_obtains_bedrooms
    bedrooms = '5+'
    form = PropertyForm.new :bedrooms => bedrooms
    assert_equal bedrooms, form.bedrooms
  end

  def test_obtains_bathrooms
    bathrooms = '3+'
    form = PropertyForm.new :bathrooms => bathrooms
    assert_equal bathrooms, form.bathrooms
  end

  def test_obtains_view_type
    view_type = 'Sea View'
    form = PropertyForm.new :view_type => view_type
    assert_equal view_type, form.view_type
  end

  def test_obtains_balcony
    form = PropertyForm.new :balcony => 'on'
    assert_equal true, form.balcony
  end

  def test_balcony_false_when_unchecked
    form = PropertyForm.new
    assert_equal false, form.balcony
  end

  def test_obtains_patio
    form = PropertyForm.new :patio => 'on'
    assert_equal true, form.patio
  end

  def test_patio_false_when_unchecked
    form = PropertyForm.new
    assert_equal false, form.patio
  end

  def test_obtains_lawn
    form = PropertyForm.new :lawn => 'on'
    assert_equal true, form.lawn
  end

  def test_lawn_false_when_unchecked
    form = PropertyForm.new
    assert_equal false, form.lawn
  end
end
