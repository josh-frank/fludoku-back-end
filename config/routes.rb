Rails.application.routes.draw do
  
  get 'board/show'
  get 'users/', to: 'users#index'
  get 'users/:id', to: 'users#show'

  get 'boards/:id', to: 'boards#show'

end
