CarrierWave.configure do |config|

  if RACK_ENV == 'staging' || RACK_ENV == 'production'
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
    config.aws_acl    = 'public-read'
    # config.asset_host = 'http://example.com'
    # config.aws_authenticated_url_expiration = 60 * 60
    config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

    config.aws_credentials = {
      access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      region:            'us-east-1'
    }

  else
    config.root 'public'
  end
end
