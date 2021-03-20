Rails.application.routes.draw do
  # get 'all_posts/index'
  root  'static_pages#index'
  # resources :users, only: :show
  resources :static_pages, only: [:index,:show]
  resources :my_accounts, only: [:index,:show,:edit,:update] do
    collection do
      get 'search'
    end
  end
  resources :posts, only: [:show,:create,:destroy] do
    resources :comments, only: :create
  end
  resources :all_posts, only: [:index]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'application#hello'
end
