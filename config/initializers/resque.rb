#Sidekiq.configure_server do |config|
#  config.redis = { url: 'redis://localhost:6379/12' }
#end
#
#Sidekiq.configure_client do |config|
#  config.redis = { url: 'redis://localhost:6379/12' }
#end

Resque.redis = Redis.new(url: 'redis://localhost:6379')
Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
