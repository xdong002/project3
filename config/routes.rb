Rails.application.routes.draw do
  root to: 'room#index'

  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users/:id/topics', to: 'users#showtopics', as: 'user_topics'
  get '/users/:id/messages', to: 'users#showmessage', as: 'user_message'
  get '/users/:id/sendmessages', to: 'users#showsendmessage', as: 'user_message_send'

  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # get '/messages', to: 'message#index'
  post '/messages', to: 'message#create'
  patch '/users/:id/messages/destroy/send/:id', to: 'message#notshowsendmessage', as: 'message_notshow_send'
  patch '/users/:id/messages/destroy/receive/:id', to: 'message#notshowreceivemessage', as: 'message_notshow_receive'

  get '/rooms', to: 'room#index'
  get '/rooms/new', to: 'room#new'
  post '/rooms', to: 'room#create'
  get '/rooms/:id', to: 'room#show', as: 'room'

  # get '/rooms/:id', to: 'topics#index'
  post '/rooms/:id', to: 'topics#create'
  get '/rooms/:id/topics/:id', to: 'topics#show', as: 'topic'
  get '/rooms/:id/topics/:id/edit', to: 'topics#edit', as: 'edit_topic'
  patch "/rooms/:id/topics/:id", to: "topics#update"
  delete '/rooms/:id/topics/destroy/:id', to: 'topics#destroy', as: 'topic_destroy'

  post '/rooms/:id/topics/:id', to: 'comments#create'
  get '/comments/:id', to: 'comments#show', as: 'comment'
  get '/comments/:id/edit', to: 'comments#edit', as: 'edit_comment'
  patch "/comments/:id", to: "comments#update"
  delete '/comments/destroy/:id', to: 'comments#destroy', as: 'comment_destroy'

end
