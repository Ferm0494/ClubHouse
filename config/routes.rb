Rails.application.routes.draw do
  devise_for :users
  get 'posts/new'
  get 'posts/create'
  root to:'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
