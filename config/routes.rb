Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace 'api' do
    namespace 'v1' do
      scope 'users/' do
        get 'index', to: 'users#index', as: 'author_index'
      end

      scope 'genres/' do
        get '/index', to: 'genres#index', as: 'index_genres'
        get '/show/:id', to: 'genres#show', as: 'show_genres'
        delete '/destroy/:id', to: 'genres#destroy', as: 'destroy_genres'
        post '/create', to: 'genres#create', as: 'create_genres'
        patch '/update/:id', to: 'genres#update', as: 'update_genre'
      end

      scope 'publishers/' do
        get '/index', to: 'publishers#index', as: 'index_publishers'
        get '/show/:id', to: 'publishers#show', as: 'show_publishers'
        delete '/destroy/:id', to: 'publishers#destroy', as: 'destroy_publishers'
        post '/create', to: 'publishers#create', as: 'create_publishers'
        patch '/update/:id', to: 'publishers#update', as: 'update_publisher'
      end
    end
  end
end
