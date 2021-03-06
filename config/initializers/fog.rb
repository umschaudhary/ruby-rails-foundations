CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],                        # required
    :region => 'ap-southeast-1'
  }
  config.fog_directory  = ENV['AWS_BUCKET']                     # required
  config.fog_public     = false                                   # optional, defaults to true
end
