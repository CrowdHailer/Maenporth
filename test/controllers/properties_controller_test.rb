require_relative '../test_config'

module Maenporth
  class PropertiesControllerTest < MiniTest::Test
    include ControllerTesting

    def app
      PropertiesController
    end

    def test_home_page_is_availabe
      assert_ok get('/')
    end

  end
end
