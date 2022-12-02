Rails.application.routes.draw do
  resources :locations
  get 'branchoffice/new', to: "branchoffice#new"
  get 'branchoffice/edit'
  get 'branchoffice/index'
  get 'locations/new'
  #get 'schedule/new', to: "schedule#new" as "schedule_new"
  devise_for :users
  root to: "main#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
