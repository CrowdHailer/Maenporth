require_relative '../test_config'

module WWW
  class ActivitiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      ActivitiesController
    end

    def test_all_categories_page_is_available
      assert_ok get('/all-categories')
    end

    def test_individual_category_page_shows
      assert_ok get('/category/discover')
    end

    def test_individual_activity_page_show
      activity = Activity.new(
        :activity_name => "Kayaking"
      ).save

      response = get("/#{activity.id}")
      assert_ok response
      assert_includes response.body, "Kayaking"
    end

    # TODO test w w/out provider

  end
end
