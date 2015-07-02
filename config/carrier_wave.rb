CarrierWave.configure do |config|

  if RACK_ENV == 'staging' || RACK_ENV == 'production'
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
    config.aws_acl    = :public_read
    # config.asset_host = 'http://example.com'
    # config.aws_authenticated_url_expiration = 60 * 60

    config.aws_credentials = {
      access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY')
    }
    config.cache_dir = "tmp/uploads"
    config.root = ''

  else
    config.root 'public'
  end
end
