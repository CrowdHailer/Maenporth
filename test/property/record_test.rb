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

    def test_can_save_view_type
      view_type = ViewType.new 'Sea View'
      record = Record.new :view_type => view_type
      assert_equal ViewType, record.view_type.class
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
  end
end
