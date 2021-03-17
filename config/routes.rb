Rails.application.routes.draw do
  root  'static_pages#index'
  resources :users, only: :show
  resources :static_pages, only: [:index,:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
