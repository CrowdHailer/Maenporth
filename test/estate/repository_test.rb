require_relative '../test_config'

class EstateTest < MiniTest::Test
  include DatabaseTesting

  def test_can_create_property
    record = Estate.create
    assert record.id
  end
end
