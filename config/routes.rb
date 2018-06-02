Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/destroy'
  get 'home/show'
  get 'vinyls/index'  # tells Rails to map requests to http://localhost:3000/vinyls/index to the vinyls controller's index action
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  resources :vinyls do
    resources :comments
  end

  root to: 'vinyls#index' # tells Rails to map requests to the root of the application to the vinyls controller's index action
end
