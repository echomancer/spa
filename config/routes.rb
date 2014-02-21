Spa::Application.routes.draw do
  resources :stores

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end