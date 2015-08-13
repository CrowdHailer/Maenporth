require_relative '../test_config'

class DescriptionTest < MiniTest::Test
  def description_string
    'A valid **description**'
  end

  def description
    @description ||= Description.new description_string
  end

  def teardown
    @description = nil
  end

  def test_shows_as_html
    assert_equal "<p>A valid <strong>description</strong></p>\n", description.html
  end

  def test_renders_only_once
    assert_same description.html, description.html
  end

  def test_show_raw
    assert_equal description_string, description.raw
  end

  def test_should_be_equal_for_raw_input
    assert_equal description, Description.new(description_string)
  end

end
