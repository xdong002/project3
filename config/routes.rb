Rails.application.routes.draw do
  root to: 'users#index'

  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/topics', to: 'topics#index'
  post '/topics', to: 'topics#create'
  get '/topics/:id', to: 'topics#show', as: 'topic'
  get '/topics/:id/edit', to: 'topics#edit', as: 'edit_topic'
  patch "/topics/:id", to: "topics#update"
  delete '/topics/destroy/:id', to: 'topics#destroy', as: 'topic_destroy'

  post '/topics/:id', to: 'comments#create'
  get '/comments/:id', to: 'comments#show', as: 'comment'
  get '/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  patch "/comments/:id", to: "comments#update"
  delete '/comments/destroy/:id', to: 'comments#destroy', as: 'comment_destroy'

end
