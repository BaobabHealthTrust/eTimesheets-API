Rails.application.routes.draw do
  post "api/v1/login", to: "users#login"

  namespace :api do
    namespace :v1 do
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
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
