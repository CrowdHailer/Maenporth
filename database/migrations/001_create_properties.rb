Sequel.migration do
  up do
    create_table :properties do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
      String :property_name
      String :sale_description
      String :sale_price
      String :estate_agent_link
      String :property_type
      String :bedrooms
      String :bathrooms
      String :view_type
      TrueClass :balcony, :default => false
      TrueClass :patio, :default => false
      TrueClass :lawn, :default => false
      TrueClass :for_sale, :default => false
      TrueClass :for_rent, :default => false
    end
  end

  down do
    drop_table :properties
  end
end
