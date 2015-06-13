Rails.application.routes.draw do
  root to: 'visitors#index'

  resource :wechat, only: [:show, :create]

end
