Sequel.migration do
  up do
    create_table :properties do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
    end
  end

  down do
    drop_table :properties
  end
end
