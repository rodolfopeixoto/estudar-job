Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :users, only: %i(new create)
  root 'users#new'
end
