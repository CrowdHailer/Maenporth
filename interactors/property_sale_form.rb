class PropertySaleForm < Vulcanize::Form
  attribute :property_name, PropertyName
  attribute :sale_description, Description
  attribute :sale_price, SalePrice
  attribute :estate_agent_link, Link
  attribute :property_sale_type, PropertyType
  attribute :bedrooms, Bedrooms
  attribute :bathrooms, Bathrooms
  attribute :view_type, ViewType
  attribute :balcony, Vulcanize::CheckBox, :default => false
  attribute :patio, Vulcanize::CheckBox, :default => false
  attribute :lawn, Vulcanize::CheckBox, :default => false
  attribute :sale_image_1, NoopAttribute
  attribute :sale_image_2, NoopAttribute
  attribute :sale_image_3, NoopAttribute
  attribute :sale_image_4, NoopAttribute
  attribute :sale_image_5, NoopAttribute
  attribute :sale_image_6, NoopAttribute
  attribute :sale_image_7, NoopAttribute
  attribute :sale_image_8, NoopAttribute
  attribute :map_image, NoopAttribute

  def empty?
    false
  end
end
