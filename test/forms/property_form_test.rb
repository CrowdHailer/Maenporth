require_relative '../test_config'

class PropertyFormTest < Minitest::Test
  def test_obtains_sale_description
    raw = '# Hello'
    description = Description.new raw
    form = PropertyForm.new :sale_description => raw
    assert_equal description, form.sale_description
  end
end
