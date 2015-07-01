Sequel.migration do
  up do
    create_table :properties do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
      String :property_name
      String :sale_description
      String :rent_description
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
    end
  end

  down do
    drop_table :properties
  end
end
