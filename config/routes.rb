Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :shorts, only: [:create]
      post 'short' => 'shorts#create'
      get 'stats' => 'shorts#stats'
    end
  end
end
