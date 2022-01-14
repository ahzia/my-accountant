Rails.application.routes.draw do
  get 'item/index'
  get 'item/create'
  get 'item/new'
  get 'item/destroy'
  get 'item/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
