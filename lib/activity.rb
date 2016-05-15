require_relative './random_identifier'

module Activity
  # The property entity is represented by the unwrapped record
  def self.new(*args, &block)
    Record.new(*args, &block)
  end

  class Record < Sequel::Model(:activities)
    include RandomIdentifier
  end

  class Category
    def self.all
      @all ||= [
        Category.new("Discover"),
        Category.new("Relax"),
        Category.new("Experience"),
        Category.new("Indulge"),
        Category.new("Adventure"),
        Category.new("Active")
      ]
    end

    def initialize(name)
      @name = name
    end

    attr_reader :name
  end

  Name = Class.new(String)
  SellingPoint = Class.new(String)
  Description = Class.new(String)
end
