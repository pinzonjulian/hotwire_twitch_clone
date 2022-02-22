Rails.application.routes.draw do
  root to: "live_streams#index"

  resources :live_streams do
    resources :messages
    resources :products
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
