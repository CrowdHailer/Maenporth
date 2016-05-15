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
      # TODO create activity
      assert_ok get('/category/discover')
    end

  end
end
