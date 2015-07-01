require_relative '../test_config'

module Property
  class RecordTest < MiniTest::Test
    include DatabaseTesting

    def test_assert_has_id
      record = Record.create
      assert record.id
    end

    def test_can_save_property_name
      raw = 'Number 45'
      property_name = PropertyName.new raw
      record = Record.new :property_name => property_name
      assert_equal property_name, record.property_name
    end

    def test_can_save_sale_description
      raw = '# Hello'
      description = Description.new raw
      record = Record.new :sale_description => description
      assert_equal description, record.sale_description
    end

    def test_can_save_sale_price
      raw = '120000'
      sale_price = SalePrice.new 120000
      record = Record.new :sale_price => sale_price
      assert_equal sale_price, record.sale_price
    end

    def test_can_save_estate_agent_link
      link = Link.new 'link.example.com'
      record = Record.new :estate_agent_link => link
      assert_equal Link, record.estate_agent_link.class
    end

    def test_can_save_enquiry_method
      method = 'email'
      record = Record.new :enquiry_method => method
      assert_equal method, record.enquiry_method
    end

    def test_can_save_enquiry_link
      link = Link.new 'link.example.com'
      record = Record.new :enquiry_link => link
      assert_equal Link, record.enquiry_link.class
    end

    def test_can_save_enquiry_email
      email = 'email@example.com'
      record = Record.new :enquiry_email => email
      assert_equal email, record.enquiry_email
    end

    def test_can_save_property_type
      property_type = PropertyType.new 'Flat'
      record = Record.new :property_type => property_type
      assert_equal PropertyType, record.property_type.class
    end

    def test_can_save_bedrooms
      bedrooms = Bedrooms.new '5+'
      record = Record.new :bedrooms => bedrooms
      assert_equal Bedrooms, record.bedrooms.class
    end

    def test_can_save_bathrooms
      bathrooms = Bathrooms.new '3+'
      record = Record.new :bathrooms => bathrooms
      assert_equal Bathrooms, record.bathrooms.class
    end

    def test_can_save_sleeps
      sleeps = Bathrooms.new '3+'
      record = Record.new :sleeps => sleeps
      assert_equal sleeps, record.sleeps
    end

    def test_can_save_view_type
      view_type = ViewType.new 'Sea View'
      record = Record.new :view_type => view_type
      assert_equal ViewType, record.view_type.class
    end

    def test_can_have_a_wifi
      record = Record.new :wifi => true
      assert_equal true, record.wifi
    end

    def test_can_have_a_bbq
      record = Record.new :bbq => true
      assert_equal true, record.bbq
    end

    def test_can_have_a_towels
      record = Record.new :towels => true
      assert_equal true, record.towels
    end

    def test_can_have_a_bath
      record = Record.new :bath => true
      assert_equal true, record.bath
    end

    def test_can_have_a_shower
      record = Record.new :shower => true
      assert_equal true, record.shower
    end

    def test_can_have_a_washing_machine
      record = Record.new :washing_machine => true
      assert_equal true, record.washing_machine
    end

    def test_can_have_a_tumble_dryer
      record = Record.new :tumble_dryer => true
      assert_equal true, record.tumble_dryer
    end

    def test_can_have_a_lawn
      record = Record.new :lawn => true
      assert_equal true, record.lawn
    end

    def test_can_have_a_patio
      record = Record.new :patio => true
      assert_equal true, record.patio
    end

    def test_can_have_a_balcony
      record = Record.new :balcony => true
      assert_equal true, record.balcony
    end

    def test_can_be_for_sale
      record = Record.new :for_sale => true
      assert_equal true, record.for_sale
    end

    def test_can_be_for_rent
      record = Record.new :for_rent => true
      assert_equal true, record.for_rent
    end

    def test_can_save_recommendation_1
      recommendation_1 = Bathrooms.new 'Go to place 1'
      record = Record.new :recommendation_1 => recommendation_1
      assert_equal recommendation_1, record.recommendation_1
    end

    def test_can_save_recommendation_2
      recommendation_2 = Bathrooms.new 'Go to place 2'
      record = Record.new :recommendation_2 => recommendation_2
      assert_equal recommendation_2, record.recommendation_2
    end

    def test_can_save_recommendation_3
      recommendation_3 = Bathrooms.new 'Go to place 3'
      record = Record.new :recommendation_3 => recommendation_3
      assert_equal recommendation_3, record.recommendation_3
    end

    def test_can_save_recommendation_4
      recommendation_4 = Bathrooms.new 'Go to place 4'
      record = Record.new :recommendation_4 => recommendation_4
      assert_equal recommendation_4, record.recommendation_4
    end

    def test_can_save_recommendation_5
      recommendation_5 = Bathrooms.new 'Go to place 5'
      record = Record.new :recommendation_5 => recommendation_5
      assert_equal recommendation_5, record.recommendation_5
    end

    def test_can_save_recommendation_6
      recommendation_6 = Bathrooms.new 'Go to place 6'
      record = Record.new :recommendation_6 => recommendation_6
      assert_equal recommendation_6, record.recommendation_6
    end

    def test_can_save_recommendation_7
      recommendation_7 = Bathrooms.new 'Go to place 7'
      record = Record.new :recommendation_7 => recommendation_7
      assert_equal recommendation_7, record.recommendation_7
    end

    def test_can_save_recommendation_8
      recommendation_8 = Bathrooms.new 'Go to place 8'
      record = Record.new :recommendation_8 => recommendation_8
      assert_equal recommendation_8, record.recommendation_8
    end
  end
end
