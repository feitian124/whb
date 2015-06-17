Rails.application.routes.draw do
  resources :users
  root to: 'visitors#index'

  resource :wechat, only: [:show, :create]

end
