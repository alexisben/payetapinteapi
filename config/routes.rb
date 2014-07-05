PayeTaPinte::Application.routes.draw do
  resources :bars


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end