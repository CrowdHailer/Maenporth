Sequel.migration do
  up do
    create_table :activities do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
      String :category
      String :activity_name
      String :header_image
      String :listings_image
      String :public_website
      String :listings_description
      String :main_description
      String :selling_point_1
      String :selling_point_2
      String :selling_point_3
      String :selling_point_4
      String :selling_point_5
      String :customer_review
      String :gallery_image_1
      String :gallery_image_2
      String :gallery_image_3
      String :gallery_image_4
      String :gallery_image_5
      String :gallery_image_6
      String :gallery_image_7
      String :gallery_image_8
      String :availability
      String :suitability
      String :you_tube_video
      String :providers_name
      String :providers_phone_number
      String :providers_email_address
      String :providers_website
      String :providers_offer_prefix
      String :providers_offer_details
      String :providers_logo
      String :providers_terms_and_conditions
      String :providers_address_line_1
      String :providers_address_line_2
      String :providers_address_line_3
      String :providers_address_city
      String :providers_address_county
      String :providers_address_postcode

    end
  end

  down do
    drop_table :activities
  end
end
