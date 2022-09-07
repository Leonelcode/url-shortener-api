Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :shorts, only: [:create]
      post 'short' => 'shorts#create'
    end
  end
end
