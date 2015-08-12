Rails.application.routes.draw do
  root to: 'visitors#index'

  get '/wechats_redirect', to: 'wechats#redirect'

  resource :wechat, only: [:show, :create]
  resources :songs

  devise_for :users
  resources :users, shallow: true do
    resources :albums
    resources :images
  end

end
