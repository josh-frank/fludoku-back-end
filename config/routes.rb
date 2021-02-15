Rails.application.routes.draw do
  
  get 'board/show'
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'

  post 'boards/', to: 'boards#create'
  get 'boards/:id', to: 'boards#show'

end
