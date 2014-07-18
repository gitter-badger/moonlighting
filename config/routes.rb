Moonlighting::Application.routes.draw do

  devise_for :users
  resources :people

  root 'people#index'

end
