require_relative '../test_config'

class PropertyRentFormTest < Minitest::Test
  def test_obtains_property_name
    property_name = 'number 38'
    form = PropertyRentForm.new :property_name => property_name
    assert_equal property_name, form.property_name
  end

  def test_obtains_rent_description
    raw = '# Hello'
    description = Description.new raw
    form = PropertyRentForm.new :rent_description => raw
    assert_equal description, form.rent_description
  end

  def test_obtains_enquiry_route
    method = 'email'
    form = PropertyRentForm.new :enquiry_route => method
    assert_equal method, form.enquiry_route
  end

  def test_obtains_enquiry_link
    link = 'link.example.com'
    form = PropertyRentForm.new :enquiry_link => link
    assert_equal link, form.enquiry_link
  end

  def test_obtains_enquiry_email
    email = 'email@example.com'
    form = PropertyRentForm.new :enquiry_email => email
    assert_equal email, form.enquiry_email
  end

  def test_obtains_property_sale_type
    property_sale_type = 'Flat'
    form = PropertyRentForm.new :property_sale_type => property_sale_type
    assert_equal property_sale_type, form.property_sale_type
  end

  def test_obtains_bedrooms
    bedrooms = '5+'
    form = PropertyRentForm.new :bedrooms => bedrooms
    assert_equal bedrooms, form.bedrooms
  end

  def test_obtains_bathrooms
    bathrooms = '3+'
    form = PropertyRentForm.new :bathrooms => bathrooms
    assert_equal bathrooms, form.bathrooms
  end

  def test_obtains_sleeps
    sleeps = '3'
    form = PropertyRentForm.new :sleeps => sleeps
    assert_equal sleeps, form.sleeps
  end

  def test_obtains_view_type
    view_type = 'Sea View'
    form = PropertyRentForm.new :view_type => view_type
    assert_equal view_type, form.view_type
  end

  def test_obtains_wifi
    form = PropertyRentForm.new :wifi => 'on'
    assert_equal true, form.wifi
  end

  def test_wifi_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.wifi
  end

  def test_obtains_bbq
    form = PropertyRentForm.new :bbq => 'on'
    assert_equal true, form.bbq
  end

  def test_bbq_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.bbq
  end

  def test_obtains_towels
    form = PropertyRentForm.new :towels => 'on'
    assert_equal true, form.towels
  end

  def test_towels_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.towels
  end

  def test_obtains_bath
    form = PropertyRentForm.new :bath => 'on'
    assert_equal true, form.bath
  end

  def test_bath_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.bath
  end

  def test_obtains_shower
    form = PropertyRentForm.new :shower => 'on'
    assert_equal true, form.shower
  end

  def test_shower_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.shower
  end

  def test_obtains_washing_machine
    form = PropertyRentForm.new :washing_machine => 'on'
    assert_equal true, form.washing_machine
  end

  def test_washing_machine_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.washing_machine
  end

  def test_obtains_tumble_dryer
    form = PropertyRentForm.new :tumble_dryer => 'on'
    assert_equal true, form.tumble_dryer
  end

  def test_tumble_dryer_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.tumble_dryer
  end

  def test_obtains_balcony
    form = PropertyRentForm.new :balcony => 'on'
    assert_equal true, form.balcony
  end

  def test_balcony_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.balcony
  end

  def test_obtains_patio
    form = PropertyRentForm.new :patio => 'on'
    assert_equal true, form.patio
  end

  def test_patio_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.patio
  end

  def test_obtains_lawn
    form = PropertyRentForm.new :lawn => 'on'
    assert_equal true, form.lawn
  end

  def test_lawn_false_when_unchecked
    form = PropertyRentForm.new
    assert_equal false, form.lawn
  end

  def test_obtains_recommendation_1
    recommendation_1 = 'Lovely'
    form = PropertyRentForm.new :recommendation_1 => recommendation_1
    assert_equal recommendation_1, form.recommendation_1
  end

  def test_obtains_recommendation_2
    recommendation_2 = 'Lovely'
    form = PropertyRentForm.new :recommendation_2 => recommendation_2
    assert_equal recommendation_2, form.recommendation_2
  end

  def test_obtains_recommendation_3
    recommendation_3 = 'Lovely'
    form = PropertyRentForm.new :recommendation_3 => recommendation_3
    assert_equal recommendation_3, form.recommendation_3
  end

  def test_obtains_recommendation_4
    recommendation_4 = 'Lovely'
    form = PropertyRentForm.new :recommendation_4 => recommendation_4
    assert_equal recommendation_4, form.recommendation_4
  end

  def test_obtains_recommendation_5
    recommendation_5 = 'Lovely'
    form = PropertyRentForm.new :recommendation_5 => recommendation_5
    assert_equal recommendation_5, form.recommendation_5
  end

  def test_obtains_recommendation_6
    recommendation_6 = 'Lovely'
    form = PropertyRentForm.new :recommendation_6 => recommendation_6
    assert_equal recommendation_6, form.recommendation_6
  end

  def test_obtains_recommendation_7
    recommendation_7 = 'Lovely'
    form = PropertyRentForm.new :recommendation_7 => recommendation_7
    assert_equal recommendation_7, form.recommendation_7
  end

  def test_obtains_recommendation_8
    recommendation_8 = 'Lovely'
    form = PropertyRentForm.new :recommendation_8 => recommendation_8
    assert_equal recommendation_8, form.recommendation_8
  end
end
