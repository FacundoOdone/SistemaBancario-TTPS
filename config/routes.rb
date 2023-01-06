Rails.application.routes.draw do
  get 'users/index', as: :index_user
  get 'users/edit/:id', to: "users#edit", as: :edit_user
  post 'users/edit/:id', to: "users#update"
  get 'users/new',                        as: :new_user
  post 'users/new' , to: "users#create"
  get 'users/destroy/:id', to: "users#destroy", as: :destroy_user

  get 'schedule/edit/:id', to: "schedule#edit", as: :edit_schedule
  post 'schedule/edit/:id', to:"schedule#update"
  get 'schedule/show/:id', to: "schedule#show", as: :show_schedule

  get 'branchoffice/new', to: "branchoffice#new", as: :new_branchoffice
  post 'branchoffice/new', to: "branchoffice#create"
  get 'branchoffice/edit/:id', to: "branchoffice#edit", as: :edit_branchoffice
  post 'branchoffice/edit/:id', to: "branchoffice#update"
  get 'branchoffice/index',                               as: :index_branchoffice
  get 'branchoffice/destroy/:id', to: "branchoffice#destroy", as: :destroy_branchoffice

  get 'locations/new',   as: :new_location
  get 'locations/', to: "locations#index", as: :index_location

  resources :locations
  devise_for :users
  root to: "main#home"
end
