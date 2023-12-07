Rails.application.routes.draw do
  resources :pickup_lines
  devise_for :users
  get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  namespace :rizzler do
    resource :demo, only: [:show, :create], controller: :demo
    resource :chat, only: [:show, :create], controller: :chat do
      scope module: :chat do
        resources :answers
      end
    end
    resource :rescue, only: [:show], controller: :rescue
  end
  resource :rizzler, only: [:show], controller: :rizzler
  # Defines the root path route ("/")
  authenticated :user do
    root to: 'rizzler#show', as: :authenticated_user_root
  end

  unauthenticated :user do
    root to: "pages#home", as: :unauthenticated_user_root
  end
end
