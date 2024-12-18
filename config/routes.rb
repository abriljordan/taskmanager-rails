Rails.application.routes.draw do
  get "tags/show"
  devise_for :users

  # Use devise_scope to ensure proper mapping for Devise routes
  devise_scope :user do
    root to: "devise/sessions#new"  # Redirect root to the sign-in page
  end

  get 'main/index', to: 'main#index'
 # root "main#index"

  match 'about', to: "main#about", via: :get

  resources :tasks
  resources :tags
  resources :categories
  
  resources :categories do
    member do
      get :delete
    end
  end

  resources :tasks do
    member do
      get :delete
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end