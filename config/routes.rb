Rails.application.routes.draw do
  get 'vinyls/index'  # tells Rails to map requests to http://localhost:3000/vinyls/index to the vinyls controller's index action

  default_url_options :host => "localhost:3000"

  resources :vinyls do
    resources :comments
  end

  root 'vinyls#index' # tells Rails to map requests to the root of the application to the vinyls controller's index action
end
