Rails.application.routes.draw do
  
  root to: "home#top"
  get 'home/about'
  devise_for :users
  resources :books
  get 'users/show'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
