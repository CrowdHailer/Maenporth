Sequel.migration do
  up do
    create_table :properties do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
      String :property_name
      String :sale_description
      String :rent_description
      String :review
      String :sale_price
      String :estate_agent_link
      String :enquiry_route
      String :enquiry_link
      String :enquiry_email
      String :property_sale_type
      String :property_rent_type
      String :bedrooms
      String :bathrooms
      String :sleeps
      String :view_type
      TrueClass :wifi, :default => false
      TrueClass :bbq, :default => false
      TrueClass :towels, :default => false
      TrueClass :bath, :default => false
      TrueClass :shower, :default => false
      TrueClass :washing_machine, :default => false
      TrueClass :tumble_dryer, :default => false
      TrueClass :balcony, :default => false
      TrueClass :patio, :default => false
      TrueClass :lawn, :default => false
      TrueClass :for_sale, :default => false
      TrueClass :for_rent, :default => false
      String :recommendation_1
      String :recommendation_2
      String :recommendation_3
      String :recommendation_4
      String :recommendation_5
      String :recommendation_6
      String :recommendation_7
      String :recommendation_8
      String :sale_image_1
      String :sale_image_2
      String :sale_image_3
      String :sale_image_4
      String :sale_image_5
      String :sale_image_6
      String :sale_image_7
      String :sale_image_8
      String :rent_image_1
      String :rent_image_2
      String :rent_image_3
      String :rent_image_4
      String :rent_image_5
      String :rent_image_6
      String :rent_image_7
      String :rent_image_8
      String :map_image
      String :rent_badge_1
      String :rent_badge_2
      String :rent_badge_3
    end
  end

  down do
    drop_table :properties
  end
end
