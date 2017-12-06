Rails.application.routes.draw do
  root to: 'users#index'

  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/topics', to: 'topics#index'
  get '/topics/new', to: 'topics#new', as: 'new_topic'
  post '/topics', to: 'topics#create'
  get '/topics/:id', to: 'topics#show', as: 'topic'
  get '/topics/:id/edit', to: 'topics#edit', as: 'edit_topic'
  patch "/topics/:id", to: "topics#update"
  delete '/topics/destroy/:id', to: 'topics#destroy', as: 'topic_destroy'

end
