Moonlighting::Application.routes.draw do

  resources :people

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  root 'people#index'

end
