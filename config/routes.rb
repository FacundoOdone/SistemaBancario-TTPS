Rails.application.routes.draw do
  get 'turn/index',  as: :index_turn
  get 'turn/new', to: "turn#new", as: :new_turn
  post 'turn/new', to: "turn#create"
  get 'turn/edit/:id', to: "turn#edit", as: :edit_turn
  post 'turn/edit/:id', to: "turn#update"
  get 'turn/destroy/:id', to: "turn#index", as: :destroy_turn

  get 'turn/complete/:id', to: "turn#complete", as: :complete_turn
  post 'turn/complete/:id', to: "turn#completed"

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
