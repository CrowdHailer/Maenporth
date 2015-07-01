class PropertyStatusForm < Vulcanize::Form
  attribute :for_rent, Vulcanize::CheckBox, :default => false
  attribute :for_sale, Vulcanize::CheckBox, :default => false

  def empty?
    false
  end
end
