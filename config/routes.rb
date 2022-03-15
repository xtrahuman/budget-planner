Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories
  # Defines the root path route ("/")
  root 'categories#index'
end
