module Property
  def self.new(*args, &block)
    # DEBT test move to entity
    Record.new(*args, &block)
  end
end
require_relative './property/record'
