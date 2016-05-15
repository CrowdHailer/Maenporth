require_relative '../test_config'

module WWW
  class ActivitiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      ActivitiesController
    end

    def test_index_page_is_available
      assert_ok get('/all-categories')
    end

  end
end
