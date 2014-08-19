Moonlighting::Application.routes.draw do

  root 'profile#show'

  resources :profile, only: [:show, :edit, :update]

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks',
                                      registrations: 'users/registrations' }

end
