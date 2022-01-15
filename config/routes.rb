Rails.application.routes.draw do
  # get 'catagory/index'
  # get 'catagory/create'
  # get 'catagory/new'
  # get 'catagory/destroy'
  # get 'catagory/show'
  # get 'item/index'
  # get 'item/create'
  # get 'item/new'
  # get 'item/destroy'
  # get 'item/show'
  devise_for :users
  resources :catagories, only: %i[index show new create destroy] do
    resources :items, only: %i[index show new create destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
