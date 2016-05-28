require_relative './random_identifier'
require_relative './image_uploader'

module Activity
  # The property entity is represented by the unwrapped record
  def self.new(*args, &block)
    Record.new(*args, &block)
  end

  class Record < Sequel::Model(:activities)
    include RandomIdentifier

    mount_uploader :header_image, ImageUploader
    mount_uploader :listings_image, ImageUploader
    mount_uploader :gallery_image_1, ImageUploader
    mount_uploader :gallery_image_2, ImageUploader
    mount_uploader :gallery_image_3, ImageUploader
    mount_uploader :gallery_image_4, ImageUploader
    mount_uploader :gallery_image_5, ImageUploader
    mount_uploader :gallery_image_6, ImageUploader
    mount_uploader :gallery_image_7, ImageUploader
    mount_uploader :gallery_image_8, ImageUploader
    mount_uploader :providers_logo, ImageUploader

    def has_provider?
      return false if providers_name.nil?
      return false if providers_name == ""
      true
    end
  end

  class Category
    def self.all
      @all ||= [
        Category.new("Discover", "Rugged cliffs, woodland walks, and tropical gardens…discover the natural delights of Cornwall both on and off the Estate."),
        Category.new("Relax", "Leave the real world behind! With our private pool, spa, sauna and spa treatments you can really relax and enjoy a tranquil break."),
        Category.new("Experience", "Make some extra special memories this holiday with our unique Cornish experiences – try yoga on the beach or boat hire from Mylor harbour."),
        Category.new("Indulge", "Cornwall: renowned worldwide for its food. Indulge in a gourmet break, treat yourself to fresh breakfast or enjoy a barbecue on the sun terrace."),
        Category.new("Adventure", "Cornwall’s naturally dramatic landscape lends itself to adventure. Jump from cliffs, explore crags and caves or find a world hidden below the water…"),
        Category.new("Active", "From our playarea to private tennis courts to the local golf course, there’s something active to suite all ages.")
      ]
    end

    def initialize(name, description)
      @name = name
      @description = description
    end

    attr_reader :name, :description
  end

  Category.all.each do |category|
    define_singleton_method "#{category.name.downcase}_activities" do
      Activity::Record.where(category: category.name).all
    end
  end

  Name = Class.new(String)
  SellingPoint = Class.new(String)
  Description = Class.new(String)
end
