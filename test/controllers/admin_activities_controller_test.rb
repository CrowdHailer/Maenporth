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
      Activity.new(
        :activity_name => "Kayaking"
      ).save

      response = get('/')
      assert_ok response
      assert_includes response.body, "Kayaking"
    end

    def test_new_page_is_availabe
      assert_ok get('/new')
    end

    def test_can_create_new_activity
      response = post('/', {activity_name: "Walking"})
      assert_match /^\/[^\/]{10,32}$/, response.location
      assert_equal 1, Activity::Record.count
    end

    def test_edit_page_is_available_for_activity
      activity = Activity.new(
        :activity_name => "Kayaking"
      ).save
      assert_ok get("/#{activity.id}/edit")
    end

    def test_edit_page_is_unavailable_for_nonexistant_activity
      response = get('/0/edit')
      assert_equal 404, response.status
    end

    def test_can_update_activity
      activity = Activity.new(
        :activity_name => "Kayaking"
      ).save
      assert_ok patch("/#{activity.id}", {activity_name: "Kayaking!"})
      assert_equal "Kayaking!", Activity::Record.first.activity_name
    end

    def test_can_delete_activity
      activity = Activity.new(
        :activity_name => "Kayaking"
      ).save
      delete "/#{activity.id}"
      assert Activity::Record.empty?
    end
  end
end
