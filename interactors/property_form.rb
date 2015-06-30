class PropertyForm < Vulcanize::Form
  attribute :sale_description, Description
  attribute :sale_price, SalePrice
end
