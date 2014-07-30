Moonlighting::Application.routes.draw do

  resources :profile

  devise_for :users, :controllers => { omniauth_callbacks: 'usersomniauth_callbacks',
                                      registrations: 'users/registrations' }

  match '/profile/:id' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup

  root 'profile#show'

end
