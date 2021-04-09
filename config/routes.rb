Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/about'
  get 'home/team'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # config/routes.rb
  devise_scope :user do
    get '/users', to: 'devise/registrations#new'
    get '/users/password', to: 'devise/passwords#new'
  end 
  
end
