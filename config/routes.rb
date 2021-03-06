Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :readings, only: [:index, :create, :show]
      resources :thermostats, only: [:index, :show]
    end
  end
end
