class PropertyForm < Vulcanize::Form
  attribute :sale_description, Description
  attribute :sale_price, SalePrice
  attribute :estate_agent_link, Link
  attribute :property_type, PropertyType
  attribute :bedrooms, Bedrooms
  attribute :bathrooms, Bathrooms
  attribute :view_type, ViewType
end
