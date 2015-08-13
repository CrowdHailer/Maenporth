require_relative '../test_config'

module WWW
  class AdminPropertiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      Admin::PropertiesController
    end

    def test_index_page_is_availabe
      assert_ok get('/')
    end

    def test_index_page_is_availabe_when_properties_to_show
      property = Estate.create
      assert_ok get('/')
    end

    def test_new_page_is_availabe
      assert_ok get('/new')
    end

    def test_edit_sale_profile_page_is_available_for_property
      property = Estate.create
      assert_ok get("/#{property.id}/edit-sale-profile")
    end

    def test_edit_sale_profile_page_is_unavailable_for_nonexistant_property
      response = get('/0/edit-sale-profile')
      assert_equal 404, response.status
    end

    def test_edit_rent_profile_page_is_available_for_property
      property = Estate.create
      assert_ok get("/#{property.id}/edit-rent-profile")
    end

    def test_edit_rent_profile_page_is_unavailable_for_nonexistant_property
      response = get('/0/edit-rent-profile')
      assert_equal 404, response.status
    end

  end
end
