Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Display a list of users, adds an index action to your users controller and defines a corresponding route. 
  resources :users, only: [:index, :create]
  resources :posts
  # API routes
  # Users have access to user action via API.
  namespace :api do
    resources :users, only: [:index, :create]
  end

  # Custom route for welcome#index
  get 'welcome/index'

  # Custom route for welcome#users
  get 'welcome/users'

  # Health check route
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'welcome#index'

  # Uncomment the next line to set the root to posts#index
  # root 'posts#index'
end
