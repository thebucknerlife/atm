redis_url = ENV['REDIS_PROVIDER'] || 'redis://localhost:6379/0/atm'
Atm::Application.config.cache_store = :redis_store, redis_url