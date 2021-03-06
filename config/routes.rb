Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  namespace :api do
    namespace :v1 do
      resources :conversations, only: [:index, :create]
      resources :messages, only: [:create]
      resources :reviews
      resources :users, only: [:index, :update]
      resources :tvmovies
      get '/getitemreviews/:tmdbid',to: 'reviews#get_item_reviews'
      post '/login', to: 'auth#create'
      post '/signup',to: 'users#create'
      get '/profile', to: 'users#profile'
      get '/findfriends/:id',to: 'users#find_friends'
    end
  end
end
