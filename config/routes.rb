Rails.application.routes.draw do
	root 'home#index'
  resources :posts
  resources :categories, only: :show
end
