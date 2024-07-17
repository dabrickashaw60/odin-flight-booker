Rails.application.routes.draw do
  get '/bookings/new', to: 'bookings#new', as: 'bookings_new'
  get 'flights/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'flights#index'
  resources :flights, only: [:index] do
    collection do
      get :all_flights
    end
  end
  resources :bookings, only: [:new, :create, :show]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
