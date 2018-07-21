Rails.application.routes.draw do
  resources :donors
  resources :projects
  resources :tasks
  resources :timesheets
  resources :departments
  resources :employees
  resources :directors
  resources :positions
  resources :user_roles
  resources :roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end