require 'sidekiq/web'

Sidekiq::Web.set :session_secret, ENV.fetch('SECRET_KEY_BASE')
Sidekiq::Web.set :sessions,       Rails.application.config.session_options

redis_params = { url: ENV.fetch("REDIS_URL") }
redis_password =  ENV["REDIS_PASSWORD"]

redis_params[:password] = redis_password if redis_password.present?

Sidekiq.configure_server do |config|
  config.redis = redis_params
end

Sidekiq.configure_client do |config|
  config.redis = redis_params
end

