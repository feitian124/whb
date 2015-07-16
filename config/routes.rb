Rails.application.routes.draw do
  root to: 'visitors#index'

  resource :wechat, only: [:show, :create]
  resources :songs

  resources :users, shallow: true do
    resources :albums
    resources :images
  end
end
