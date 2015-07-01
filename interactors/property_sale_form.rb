class PropertySaleForm < Vulcanize::Form
  attribute :property_name, PropertyName
  attribute :sale_description, Description
  attribute :sale_price, SalePrice
  attribute :estate_agent_link, Link
  attribute :property_type, PropertyType
  attribute :bedrooms, Bedrooms
  attribute :bathrooms, Bathrooms
  attribute :view_type, ViewType
  attribute :balcony, Vulcanize::CheckBox, :default => false
  attribute :patio, Vulcanize::CheckBox, :default => false
  attribute :lawn, Vulcanize::CheckBox, :default => false

  def empty?
    false
  end
end
