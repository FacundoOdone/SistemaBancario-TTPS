Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit/:id', to: "users#edit", as: :edit_user
  post 'users/edit/:id', to: "users#update"
  get 'users/new'
  post 'users/new' , to: "users#create"
  get 'users/destroy/:id', to: "users#destroy"

  get 'schedule/edit/:id', to: "schedule#edit"
  post 'schedule/edit/:id', to:"schedule#update"
  get 'schedule/show/:id', to: "schedule#show"

  get 'branchoffice/new', to: "branchoffice#new"
  post 'branchoffice/new', to: "branchoffice#create"
  get 'branchoffice/edit/:id', to: "branchoffice#edit"
  post 'branchoffice/edit/:id', to: "branchoffice#update"
  get 'branchoffice/index'
  get 'branchoffice/destroy/:id', to: "branchoffice#destroy"

  get 'locations/new'

  resources :locations
  devise_for :users
  root to: "main#home"
end
