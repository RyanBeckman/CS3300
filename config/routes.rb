Rails.application.routes.draw do
  # Route default site url
  root "projects#index"
  resources :projects
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
