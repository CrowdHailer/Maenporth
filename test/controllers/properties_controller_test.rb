require_relative '../test_config'

module Maenporth
  class PropertiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      PropertiesController
    end

    def test_home_page_is_availabe
      assert_ok get('/')
    end

    def test_new_page_is_availabe
      assert_ok get('/new')
    end

    def test_edit_page_is_available_for_property
      property = Estate.create
      assert_ok get("/#{property.id}/edit")
    end

    def test_edit_page_is_unavailable_for_nonexistant_property
      response = get('/0/edit')
      assert_equal 404, response.status
    end

  end
end
