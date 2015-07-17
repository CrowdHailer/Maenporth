class PropertyRentForm < Vulcanize::Form
  attribute :property_name, PropertyName
  attribute :rent_description, Description
  # TODO destringify
  attribute :enquiry_route, String
  attribute :enquiry_link, Link
  attribute :enquiry_email, String
  attribute :property_rent_type, PropertyType
  attribute :bedrooms, Bedrooms
  attribute :bathrooms, Bathrooms
  # TODO destringify
  attribute :sleeps, String
  attribute :view_type, ViewType
  attribute :wifi, Vulcanize::CheckBox, :default => false
  attribute :bbq, Vulcanize::CheckBox, :default => false
  attribute :towels, Vulcanize::CheckBox, :default => false
  attribute :bath, Vulcanize::CheckBox, :default => false
  attribute :shower, Vulcanize::CheckBox, :default => false
  attribute :washing_machine, Vulcanize::CheckBox, :default => false
  attribute :tumble_dryer, Vulcanize::CheckBox, :default => false
  attribute :balcony, Vulcanize::CheckBox, :default => false
  attribute :patio, Vulcanize::CheckBox, :default => false
  attribute :lawn, Vulcanize::CheckBox, :default => false
  attribute :recommendation_1, String
  attribute :recommendation_2, String
  attribute :recommendation_3, String
  attribute :recommendation_4, String
  attribute :recommendation_5, String
  attribute :recommendation_6, String
  attribute :recommendation_7, String
  attribute :recommendation_8, String
  attribute :rent_image_1, NoopAttribute
  attribute :rent_image_2, NoopAttribute
  attribute :rent_image_3, NoopAttribute
  attribute :rent_image_4, NoopAttribute
  attribute :rent_image_5, NoopAttribute
  attribute :rent_image_6, NoopAttribute
  attribute :rent_image_7, NoopAttribute
  attribute :rent_image_8, NoopAttribute
  attribute :map_image, NoopAttribute

  def empty?
    false
  end
end
