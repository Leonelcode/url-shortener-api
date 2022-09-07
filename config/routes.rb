Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :shorts, only: [:create]
      post 'short' => 'shorts#create'
      get 'short/:shortcode' => 'shorts#fetch_short'
      get 'stats' => 'shorts#stats'
    end
  end
end
