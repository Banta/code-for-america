CodeForAmerica::Application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/sign-in'  => 'sessions#new',     as: :sign_in
    get '/sign-out' => 'sessions#destroy', as: :sign_out
  end

  resources :users, only: [:show]

  resources :applications, only: [:index, :show]
  resources :brigades, only: [:show]

  root :to => 'home#index'
end
