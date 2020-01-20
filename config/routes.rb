Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :users, only: %i[index new create]
  root 'users#index'
end
