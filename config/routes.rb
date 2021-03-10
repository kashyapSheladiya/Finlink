Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :readings, only: [:index, :create, :show]
      get '/stats', to: 'thermostats#index'
      get '/stats/:id', to: 'thermostats#show'
    end
  end
end
