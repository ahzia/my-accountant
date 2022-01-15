Rails.application.routes.draw do
  root 'catagories#splash'
  devise_for :users
  # authenticated :user do
  #   root 'catagories#index', as: :authenticated_root
  # end
  # root to: 'users#index'
  resources :catagories, only: %i[index show new create destroy] do
    resources :items, only: %i[index show new create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
