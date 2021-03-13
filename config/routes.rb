Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: 'pages#dashboard', as: :authenticated_root
  end
  root to: 'pages#home'

  resources :pets, only: [:new, :create, :show] do 
    member do
      post :add_picture
      delete :remove_picture
    end
  end

  #FRIENDS ROUTES
  post '/pets/:id', to: 'friends#search_friend', as: 'search_friend'
  post "/friends/add" => "friends/add"
  post "/friends/reject" => "friends/reject"
  post "/friends/remove" => "friends/remove"
  resources :friends, only: [:new, :index, :create]

  #CALENDAR ROUTES
  resources :events

  #EXPENSES ROUTES
  # resources :expenses do  
  #  resources :expense_types
  # end

  # resources :budgets do  
  #   resources :expense_types
  # end

  resources :expense_types do  
    resources :expenses, except: [:show]
    resources :budgets
  end
 
  # EXPLORE ROUTES
 
  # resources :places, only: [:new] do
  #   resources :favourite_places, except: [:edit, :update]
  # end

  resources :places, only: [:index, :show]
  get '/places/check_place/:id', to: 'places#check_place', as: 'check_place'
  post '/places/add_place', to: 'places#add_place', as: 'add_place'

  resources :favourite_places, only: [:index, :destroy]
  get '/favourite_places/:id', to: 'favourite_places#add', as: 'add_to_favourites'
  
  #PHOTOS ROUTES
  resources :photos, only: [:show, :index] 

  #CHATROOM ROUTES
  resources :chatrooms, only: [:show, :index] do 
    resources :messages, only: :create
  end
end