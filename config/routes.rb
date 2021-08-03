Rails.application.routes.draw do
  resources :books
  get 'users/show'
  get 'homes/about'
  root to: "homes#top"
  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
