Sequel.migration do
  up do
    create_table(:offers) do
      primary_key :id, :type => :varchar, :auto_increment => false, :unique => true
      String :customer_name, :null => false
      String :customer_email_address, :null => false
      String :code, :null => false
      foreign_key :activity_id, :activities, :type => :varchar, :null => false
      DateTime :created_at, :null => false
      DateTime :redeemed_at
      Integer :transaction_value
    end
  end

  down do
    drop_table(:offers)
  end
end
