require_relative '../random_identifier'

module Property
  class Record < Sequel::Model(:properties)
    include RandomIdentifier
    
  end
end
