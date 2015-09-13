Rails.application.routes.draw do
  devise_for :users, :skip => :registrations
	root 'home#index'
  resources :posts
  resources :categories
  resources :courses
  get '/users/sign_up', to: redirect('/#/home')
  get '/users/sign_out', to: redirect('/#/home')
end
