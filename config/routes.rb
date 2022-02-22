Rails.application.routes.draw do
  root to: "live_streams#index"

  resources :products
  resources :live_streams do
    resources :messages
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
