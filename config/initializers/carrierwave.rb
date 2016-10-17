CarrierWave.configure do |config|
    config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'us-east-1'
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'protospaceproto'
        config.asset_host = 'https://s3.amazonaws.com/protospaceproto'
    when 'production'
        config.fog_directory  = 'protospaceproto'
        config.asset_host = 'https://s3.amazonaws.com/protospaceproto'
    when 'test'
      config.storage = :file
    end
  #     config.ignore_integrity_errors = false
  # config.ignore_processing_errors = false
  # config.ignore_download_errors = false
end
