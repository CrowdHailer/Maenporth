require 'carrierwave/processing/mini_magick'

class PDFUploader < CarrierWave::Uploader::Base

  def extension_white_list
    %w(pdf)
  end

  def store_dir
    "uploads/pdf/#{model.id}"
  end

  def filename
    "#{mounted_as}.#{file.extension.downcase}" if file
  end

end
