Sequel.migration do
  up do
    add_column :properties, :estate_managed, TrueClass
    from(:properties).update(:estate_managed => false)
  end

  down do
    drop_column :properties, :estate_managed
  end
end
