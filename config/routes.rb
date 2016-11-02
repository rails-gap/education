Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }

  root 'home#index'

  resources :videos, only: [:index, :show] do
    collection do
      get :autocomplete_video_title
    end
  end

  namespace :admin do
    resources :users, only: [:index, :edit, :update]
    resources :videos do
      get 'delete'
    end
  end

end
