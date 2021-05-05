Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #

  namespace 'api' do
    namespace 'v1' do
      scope 'users/' do
        get 'index', to: 'users#index', as: 'author_index'
      end
    end
  end
end
