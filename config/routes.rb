Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
	root 'home#index'
  resources :posts
  resources :categories
  resources :courses
end
