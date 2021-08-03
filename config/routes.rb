Rails.application.routes.draw do
  get 'users/show'
  get 'homes/about'
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
