Rails.application.routes.draw do
  resources :locations
  get 'branchoffice/new'
  get 'branchoffice/edit'
  get 'branchoffice/index'
  devise_for :users
  root to: "main#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
