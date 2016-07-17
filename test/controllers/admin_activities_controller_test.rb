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
        :activity_name => "Kayaking",
        :category => "Discover"
      ).save

      response = get('/')
      assert_ok response
      assert_includes response.body, "Kayaking"
    end

    def test_new_page_is_availabe
      assert_ok get('/new')
    end

    def test_can_create_new_activity
      skip 'we dont actually use post to make new things'
      response = post('/', {activity_name: "Walking", category: "Discover"})
      assert_match /^\/[^\/]{10,32}$/, response.location
      assert_equal 1, Activity::Record.count
    end

    def test_edit_page_is_available_for_activity
      activity = Activity.new(
        :category => "Discover",
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
        :category => "Discover",
        :activity_name => "Kayaking"
      ).save
      response = patch("/#{activity.id}", {activity_name: "Kayaking!"})
      assert_equal "Kayaking!", Activity::Record.first.activity_name
    end

    def test_can_delete_activity
      activity = Activity.new(
        :category => "Discover",
        :activity_name => "Kayaking"
      ).save
      delete "/#{activity.id}"
      assert Activity::Record.empty?
    end

    def test_can_delete_activity_with_offers
      activity = Activity.new(
        :category => "Discover",
        :activity_name => "Kayaking",
        :providers_name => "outdoors corp",
        :providers_offer_prefix => "OUC"
      ).save
      offer = Offer.new(
        :customer_name => "Bill",
        :customer_email_address => "bill@example.com",
        :activity => activity
      ).save
      delete "/#{activity.id}"
      assert Activity::Record.empty?
    end
  end
end
