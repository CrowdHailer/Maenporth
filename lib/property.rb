module Property
  def self.new(*args, &block)
    # TODO test move to entity
    Record.new(*args, &block)
  end
end
require_relative './property/record'
