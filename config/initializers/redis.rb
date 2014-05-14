redis_url = ENV["REDISCLOUD_URL"] || "redis://127.0.0.1:6379/0/quito-backend"
QuitoBackend::Application.config.cache_store = :redis_store, redis_url

# if ENV["REDISCLOUD_URL"]
#     uri = URI.parse(ENV["REDISCLOUD_URL"])
#     $redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
# end