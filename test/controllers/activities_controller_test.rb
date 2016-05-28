require_relative '../test_config'

module WWW
  class ActivitiesControllerTest < MiniTest::Test
    include ControllerTesting
    include DatabaseTesting

    def app
      ActivitiesController
    end

    def test_all_categories_page_is_available
      assert_ok get('/')
    end

    def test_individual_category_page_shows
      assert_ok get('/category/discover')
    end

    def test_individual_activity_page_show_with_provider
      activity = Activity.new(
        :activity_name => "Kayaking",
        :category => "Discover",
        :providers_name => "kayaking times"
      ).save

      response = get("/#{activity.id}")
      assert_ok response
      assert_includes response.body, "Kayaking"
      assert_includes response.body, "kayaking times"
    end

    def test_individual_activity_page_show
      activity = Activity.new(
        :activity_name => "Kayaking",
        :category => "Discover",
        :providers_name => "kayaking times"
      ).save

      response = get("/#{activity.id}")
      assert_ok response
      assert_includes response.body, "Kayaking"
      assert_includes response.body, "kayaking times"
    end

    def test_creating_an_offer_code_for_activity
      activity = Activity.new(
        :activity_name => "Kayaking",
        :category => "Discover",
        :providers_name => "kayaking times"
      ).save

      assert Offer::Record.empty?
      response = post("/activities/#{activity.id}/generate-offer", {
        :customer_name => "Danny",
        :customer_email_address => "danny@boi.io"
      })
      assert_equal 302, response.status
      refute Offer::Record.empty?
    end

    def test_can_get_an_offer_page

      activity_record = Activity::Record.create(
        :category => "Discover",
        :activity_name => "Climbing",
        :providers_name => "Bobs outings",
        :providers_offer_prefix => "BOB"
      )

      record = Offer.new(
      :customer_name => "Mike",
      :customer_email_address => "mike@lovit.org",
      :activity => activity_record
      ).save

      response = get("/offers/#{record.id}")
      assert_ok response
    end

  end
end
