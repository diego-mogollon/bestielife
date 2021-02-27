Rails.application.routes.draw do
  get 'photos/show'
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
  post '/pets/:id', to: 'friends#add_friend', as: 'add_friend'
  # post '/pets/:id', to: 'friends#reject_friend', as: 'reject_friend'
  post "/friends/add" => "friends/add"
  post "/friends/reject" => "friends/reject"
  post "/friends/remove" => "friends/remove"
  get "/friends/search" => "friends/search"
  post "/friends/search" => "friends/search"
  resources :friends, only: [:new, :index, :create]
  #CALENDAR ROUTES
  get 'calendar', to: 'pages#calendar'
  resources :events
  resources :expenses do  
   resources :expense_types
  end
  resources :budgets do  
    resources :expense_types
   end
  resources :places, only: [:index, :show] do
    resources :favourite_places, except: [:edit, :update]
  end
  resources :photos, only: [:show] 
end