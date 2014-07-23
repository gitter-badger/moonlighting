Moonlighting::Application.routes.draw do

  resources :profile

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/profile/:id' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root 'profile#index'

end
