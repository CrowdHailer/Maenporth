require_relative '../test_config'

module WWW
  class AdminControllerTest < MiniTest::Test
    include ControllerTesting

    def app
      AdminController
    end

    def test_home_page_is_unavailabe
      get('/')
      assert_equal 401, last_response.status
    end

    def test_home_page_can_be_accesses_with_basic_auth
      basic_authorize ENV.fetch('ADMIN_USERNAME'), ENV.fetch('ADMIN_PASSWORD')
      assert_ok get('/')
    end

  end
end
