CarrierWave.configure do |config|

  # config.storage    = :aws
  # config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
  # # config.aws_acl    = :public_read
  # # config.asset_host = 'http://example.com'
  # config.aws_authenticated_url_expiration = 60 * 60
  #
  # config.aws_credentials = {
  #   access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
  #   secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
  # }
  config.root 'public'
end
require 'carrierwave/processing/mini_magick'

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fit: [644, 344]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def store_dir
    "uploads/images/#{model.id}"
  end

  def filename
    "#{mounted_as}.#{file.extension.downcase}" if file
  end

end
