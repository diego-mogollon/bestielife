Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root to: 'pages#dashboard', as: :authenticated_root
  end
  root to: 'pages#home'

  resources :pets, only: [:new, :create] do 
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
    resources :expenses
    resources :budgets
  end
 
  # EXPLORE ROUTES
 
  # resources :places, only: [:new] do
  #   resources :favourite_places, except: [:edit, :update]
  # end

  get '/places', to: 'places#index', as: 'places'
  get '/places/show/:name', to: 'places#show', as: 'show_place' 
  #PHOTOS ROUTES
  resources :photos, only: [:show] 

  #CHATROOM ROUTES
  resources :chatrooms, only: [:show, :index] do 
    resources :messages, only: :create
  end
end