Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/new'
  post 'users/new' , to: "users#create"
  get 'schedule/new', to: "schedule#new"
  get 'schedule/edit'
  get 'schedule/index'
  get 'schedule/create'
  resources :locations
  get 'branchoffice/new', to: "branchoffice#new"
  post 'branchoffice/new', to: "branchoffice#create"
  get 'branchoffice/edit/:id', to: "branchoffice#edit"
  post 'branchoffice/edit/:id', to: "branchoffice#update"
  get 'branchoffice/index'
  get 'locations/new'
  devise_for :users
  root to: "main#home"
end
