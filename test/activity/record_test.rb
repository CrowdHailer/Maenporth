require_relative '../test_config'

module Activity
  class RecordTest < MiniTest::Test
    include DatabaseTesting

    def test_assert_has_id
      record = Record.create(
        :category => "Discover",
        :activity_name => "Climbing"
      )
      assert record.id
    end

    def test_can_find_activities_by_category
      kayaking = Record.create(
        :category => "Discover",
        :activity_name => "Climbing"
      )
      spa = Record.create(
        :category => "Relax",
        :activity_name => "Climbing"
      )

      activities = Activity.discover_activities
      assert_equal 1, activities.count
      assert_equal 0, Activity.experience_activities.count
    end

    def test_can_have_activity_name
      raw = 'Kayaking'
      activity_name = Name.new raw
      record = Record.new :activity_name => activity_name
      assert_equal activity_name, record.activity_name
    end

    def test_can_activity_listings_description
      raw = '# Hello'
      listings_description = Description.new raw
      record = Record.new :listings_description => listings_description
      assert_equal listings_description, record.listings_description
    end

    def test_can_have_selling_point_1
      selling_point_1 = SellingPoint.new 'Go to place 1'
      record = Record.new :selling_point_1 => selling_point_1
      assert_equal selling_point_1, record.selling_point_1
    end

    def test_can_have_selling_point_2
      selling_point_2 = SellingPoint.new 'Go to place 2'
      record = Record.new :selling_point_2 => selling_point_2
      assert_equal selling_point_2, record.selling_point_2
    end

    def test_can_have_selling_point_3
      selling_point_3 = SellingPoint.new 'Go to place 3'
      record = Record.new :selling_point_3 => selling_point_3
      assert_equal selling_point_3, record.selling_point_3
    end

    def test_can_have_selling_point_4
      selling_point_4 = SellingPoint.new 'Go to place 4'
      record = Record.new :selling_point_4 => selling_point_4
      assert_equal selling_point_4, record.selling_point_4
    end

    def test_can_have_selling_point_5
      selling_point_5 = SellingPoint.new 'Go to place 5'
      record = Record.new :selling_point_5 => selling_point_5
      assert_equal selling_point_5, record.selling_point_5
    end
  end
end
