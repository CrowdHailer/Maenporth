require_relative '../test_config'

class PropertyStatusFormTest < Minitest::Test

  def test_obtains_for_rent_status
    form = PropertyStatusForm.new :for_rent => 'on'
    assert_equal true, form.for_rent
  end

  def test_for_rent_status_false_when_unchecked
    form = PropertyStatusForm.new
    assert_equal false, form.for_rent
  end

  def test_obtains_for_sale_status
    form = PropertyStatusForm.new :for_sale => 'on'
    assert_equal true, form.for_sale
  end

  def test_for_sale_status_false_when_unchecked
    form = PropertyStatusForm.new
    assert_equal false, form.for_sale
  end
end
