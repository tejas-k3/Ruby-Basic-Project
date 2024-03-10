Rails.application.routes.draw do
  resources :todos do
    collection do
      get :pending # Get all todos marked as pending
      get :done # Get all todos marked as done
      # More can be added to play around with timestamps!
    end
    member do
      get :status # Get status of that particular todo item
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
