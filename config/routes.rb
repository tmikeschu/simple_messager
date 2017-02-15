Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'

  resources :conversations, only: [:new, :create, :show] do
    scope module: :conversations do
      resources :messages, only: [:new, :create]
    end
  end
end
