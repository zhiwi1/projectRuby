Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
  root 'persons#profile'
  resources :messages
  resources :rooms
  get 'persons/profile'
  resources :posts
  get 'posts/index', to: 'posts#index'
  get 'answers/new', to: 'answers#new'
  get 'tags/:tag', to: 'posts#index', as: :tag

  resources :persons

  resources :posts do
    resources :comments
    resources :answers
  end
    devise_for :users, skip: :omniauth_callbacks
  end
  devise_for :users, only: :omniauth_callbacks, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  end