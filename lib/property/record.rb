require_relative '../random_identifier'
require_relative '../property_attributes'

module Property
  class Record < Sequel::Model(:properties)
    include RandomIdentifier
    plugin :serialization

    serialize_attributes [Description.method(:dump), Description.method(:new)], :sale_description
    serialize_attributes [SalePrice.method(:dump), SalePrice.method(:new)], :sale_price
    serialize_attributes [:to_s, Link.method(:new)], :estate_agent_link
    serialize_attributes [:to_s, Bedrooms.method(:new)], :bedrooms
    serialize_attributes [:to_s, Bathrooms.method(:new)], :bathrooms
    serialize_attributes [:to_s, PropertyType.method(:new)], :property_type
    serialize_attributes [:to_s, ViewType.method(:new)], :view_type
  end
end
