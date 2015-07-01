require_relative '../random_identifier'
require_relative '../property_attributes'

module Property
  class Record < Sequel::Model(:properties)
    include RandomIdentifier
    plugin :serialization

    serialize_attributes [Description.method(:dump), Description.method(:new)], :sale_description
    serialize_attributes [Description.method(:dump), Description.method(:new)], :rent_description
    serialize_attributes [SalePrice.method(:dump), SalePrice.method(:new)], :sale_price
    serialize_attributes [->(x){x}, Link.method(:new)], :estate_agent_link
    serialize_attributes [->(x){x}, Link.method(:new)], :enquiry_link
    serialize_attributes [->(x){x}, Bedrooms.method(:new)], :bedrooms
    serialize_attributes [->(x){x}, Bathrooms.method(:new)], :bathrooms
    serialize_attributes [->(x){x}, PropertyType.method(:new)], :property_sale_type, :property_rent_type
    serialize_attributes [->(x){x}, ViewType.method(:new)], :view_type

    def sale_description
      # TODO move to enitity and test
      super || Description.new('')
    end
  end
end
