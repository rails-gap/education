Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }

  root 'home#index'

  resources :videos
end
