Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'authentication' }

  devise_scope :user do
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated do
      root 'videos#index'
    end
  end

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
    resources :categories do
      get 'delete'
    end
    resources :events do
      get 'delete'
    end
  end

end
