# calculated from here: http://manuel.manuelles.nl/sidekiq-heroku-redis-calc/
# additional config options from sidekiq docs

require 'sidekiq'

Sidekiq.configure_client do |config|
    config.redis = { 
    :url => ENV['REDISCLOUD_URL'] || 'redis://localhost:6379', 
    :namespace => 'sidekiq', 
    :size => 2
  }
end

Sidekiq.configure_server do |config|
  # The config.redis is calculated by the 
  # concurrency value so you do not need to 
  # specify this. For this demo I do 
  # show it to understand the numbers
  config.redis = { 
    :url => ENV['REDISCLOUD_URL'] || 'redis://localhost:6379', 
    :namespace => 'sidekiq', 
    :size => 4
  }
end