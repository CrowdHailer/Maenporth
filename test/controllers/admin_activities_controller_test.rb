require_relative '../test_config'

module WWW
  class AdminActivitiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      Admin::ActivitiesController
    end

    def test_index_page_is_availabe
      assert_ok get('/')
    end

    def test_index_page_is_availabe_when_activities_to_show
      # TODO create activity
      assert_ok get('/')
    end

    def test_new_page_is_availabe
      assert_ok get('/new')
    end

    def test_edit_page_is_available_for_activity
      # TODO create activity
      # assert_ok get("/#{activity.id}/edit")
    end

    def test_edit_page_is_unavailable_for_nonexistant_activity
      response = get('/0/edit')
      assert_equal 404, response.status
    end

    def test_can_update_activity
      # TODO
    end

    def test_can_delete_activity
      # property = Estate.create
      # delete "/#{property.id}"
      # assert Estate.empty?
    end
  end
end
