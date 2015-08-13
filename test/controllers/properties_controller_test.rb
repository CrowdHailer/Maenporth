require_relative '../test_config'

module WWW
  class PropertiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      PropertiesController
    end

    def test_all_for_sale_page_is_availabe
      assert_ok get('/for-sale')
    end

    def test_all_for_sale_page_is_availabe_when_properties_to_show
      property = Estate.create
      assert_ok get('/for-sale')
    end

    def test_all_for_rent_page_is_availabe
      assert_ok get('/for-rent')
    end

    def test_all_for_rent_page_is_availabe_when_properties_to_show
      property = Estate.create
      assert_ok get('/for-rent')
    end

    def test_for_sale_page_is_available_for_property
      property = Estate.create
      assert_ok get("/#{property.id}/for-sale")
    end

    def test_for_sale_page_is_unavailable_for_nonexistant_property
      response = get('/0/for-sale')
      assert_equal 404, response.status
    end

    def test_for_rent_page_is_available_for_property
      property = Estate.create
      assert_ok get("/#{property.id}/for-rent")
    end

    def test_for_rent_page_is_unavailable_for_nonexistant_property
      response = get('/0/for-rent')
      assert_equal 404, response.status
    end

    def test_for_enquire_is_available_for_property
      property = Estate.create
      assert_ok get("/#{property.id}/enquire")
    end

    def test_for_enquire_is_unavailable_for_nonexistant_property
      response = get('/0/enquire')
      assert_equal 404, response.status
    end

  end
end
