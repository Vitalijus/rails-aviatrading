CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS', 
    :aws_access_key_id      => 'AKIAIN5PF6AX4ENVUQKQ', 
    :aws_secret_access_key  => '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',
    :region                 => 'us-west-2' 
  }

  config.fog_directory  = 'aeropoly'
end