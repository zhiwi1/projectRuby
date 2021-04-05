Rails.application.routes.draw do
  get 'persons/profile'
  root 'persons#profile'
  resources :posts
  resources :persons
  get 'posts/index' , to: 'posts#index'
  get 'answers/new' , to: 'answers#new'
  get 'tags/:tag', to: 'posts#index', as: :tag
  resources :posts do
    resources :comments
    resources :answers
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
