Rails.application.routes.draw do
  devise_for :admins
  #devise_for :users
  devise_for :users, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  namespace 'api' do
    namespace 'v1' do
      scope 'users/' do
        get 'index', to: 'users#index', as: 'author_index'
      end
      
      post 'sign-in', to:'sessions#sign_in'
    end
  end
end


