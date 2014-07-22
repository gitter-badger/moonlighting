Moonlighting::Application.routes.draw do

  resources :people

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/people/:id' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root 'people#index'

end
