require_relative '../random_identifier'
require_relative '../property_attributes'
require_relative '../image_uploader'
require_relative '../badge_uploader'

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

    mount_uploader :sale_image_1, ImageUploader
    mount_uploader :sale_image_2, ImageUploader
    mount_uploader :sale_image_3, ImageUploader
    mount_uploader :sale_image_4, ImageUploader
    mount_uploader :sale_image_5, ImageUploader
    mount_uploader :sale_image_6, ImageUploader
    mount_uploader :sale_image_7, ImageUploader
    mount_uploader :sale_image_8, ImageUploader
    mount_uploader :rent_image_1, ImageUploader
    mount_uploader :rent_image_2, ImageUploader
    mount_uploader :rent_image_3, ImageUploader
    mount_uploader :rent_image_4, ImageUploader
    mount_uploader :rent_image_5, ImageUploader
    mount_uploader :rent_image_6, ImageUploader
    mount_uploader :rent_image_7, ImageUploader
    mount_uploader :rent_image_8, ImageUploader
    mount_uploader :map_image, ImageUploader
    mount_uploader :rent_badge_1, BadgeUploader
    mount_uploader :rent_badge_2, BadgeUploader
    mount_uploader :rent_badge_3, BadgeUploader

    def sale_description
      # TODO move to enitity and test
      super || Description.new('')
    end

    def formatted_sale_price
      # TODO move to page/presenter object
      sale_price.to_s.split('.')[0]
    end
  end
end
