require_relative '../test_config'

module Property
  class RecordTest < MiniTest::Test
    include DatabaseTesting

    def test_assert_has_id
      record = Record.create
      assert record.id
    end
  end
end
