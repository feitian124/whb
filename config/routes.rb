Rails.application.routes.draw do
  resources :images
  resources :users
  root to: 'visitors#index'

  resource :wechat, only: [:show, :create]

end
