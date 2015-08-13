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

    def test_can_update_sale_profile
      property = Estate.create
      patch "/#{property.id}/sale-profile", {"property" => {"sale_description" => "new description"}}
      property.reload
      assert_ok last_response
      assert_equal "new description", property.sale_description.raw
    end

    def test_can_update_rent_profile
      property = Estate.create
      patch "/#{property.id}/rent-profile", {"property" => {"rent_description" => "new description"}}
      property.reload
      assert_ok last_response
      assert_equal "new description", property.rent_description.raw
    end

    def test_can_update_current_status
      property = Estate.create
      patch "/#{property.id}/status", {"property" => {"for_rent" => "on", "for_sale" => "on"}}
      property.reload
      assert property.for_sale
      assert property.for_rent
    end

    def test_can_delete_property
      property = Estate.create
      delete "/#{property.id}"
      assert Estate.empty?
    end
  end
end
