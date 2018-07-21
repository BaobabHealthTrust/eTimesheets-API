Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post "login", to: "users#login"
      resources :donors
      resources :projects
      resources :tasks
      resources :timesheets
      resources :departments
      resources :employees
      resources :directors
      resources :positions
          resources :roles
      resources :users
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
