Rails.application.routes.draw do
  post '/sessions/', to: 'sessions#create'
  # get '/sessions/', to: 'sessions#create'

  get 'sessions/destroy'

  namespace :api, defaults: { format: :json }, path: '/api'  do
  # namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create, :show]
      get '/users/:id/transactions', to: 'users#user_transactions'

      resources :bills, only: [:index, :create, :show, :destroy]
      resources :event_plannings, only: [:index, :create, :show, :update, :destroy]
      resources :categories, only: [:index, :create]
      resources :transactions, only: [:index, :create]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
