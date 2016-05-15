Sequel.migration do
  up do
    create_table :activities do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
      String :activity_name
      String :description
      String :selling_point_1
      String :selling_point_2
      String :selling_point_3
      String :selling_point_4
      String :selling_point_5

    end
  end

  down do
    drop_table :properties
  end
end
