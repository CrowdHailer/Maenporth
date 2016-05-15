require_relative './random_identifier'

module Activity
  # The property entity is represented by the unwrapped record
  def self.new(*args, &block)
    Record.new(*args, &block)
  end

  class Record < Sequel::Model(:activities)
    include RandomIdentifier
  end

  Name = Class.new(String)
  SellingPoint = Class.new(String)
  Description = Class.new(String)
end
