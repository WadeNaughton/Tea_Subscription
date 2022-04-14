Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:index, :create, :update]
      get '/customer', to: 'customer#show'
      get '/customers', to: 'customer#index'
      post '/customer', to: 'customer#create'
      post '/tea', to: 'tea#create'
    end
  end
end
