Rails.application.routes.draw do
  get 'accounts/show'
  get 'sessions/new'

	root 'home#index'

  get '/signup', to: 'users#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'session#destroy', as: 'logout'

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :home
  resources :accounts
  resources :sellers do
    resources :homes do
      resources :addresses
    end
  end

end
