Rails.application.routes.draw do
  resources :categories
  root 'publicaciones#index', except: :show
  delete 'publicaciones/:id', to: 'publicaciones#destroy', as: :eliminar_publicacion
  patch "/publicaciones/:id", to: 'publicaciones#update'
  post '/publicaciones', to: 'publicaciones#create'
  get '/publicaciones/new', to: 'publicaciones#new', as: :nueva_publicacion
  get '/publicaciones', to: 'publicaciones#index'
  get '/publicaciones/:id', to: 'publicaciones#show', as: :publicacion
  get '/publicaciones/:id/edit', to: 'publicaciones#edit', as: :editar_publicacion

  namespace :authentication, path: '', as: '' do  
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end

end
