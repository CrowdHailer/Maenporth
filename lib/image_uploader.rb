require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process resize_to_fit: [968, 457]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/images/#{model.id}"
  end

  def default_url(*args)
    "/img/upload.svg"
  end

  def filename
    "#{mounted_as}.#{file.extension.downcase}" if file
  end

end
