Rails.application.routes.draw do
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
  }
  devise_for :admins,:controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/registrations',
   }
#----------admin--------------
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
    resources :items,only: [:index,:new,:create,:show,:edit,:update,]
    get 'top'=>'items#top'
    resources :genres,only: [:index,:create,:edit,:update, :show]
    resources :orders,only: [:index,:show,:update]
    resource :order_details,only: [:update]
  end
#--------------------------------


#----------customer--------------
  resources :customers, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :addresses, only: [:index, :create, :show, :edit, :update, :destroy]
  end
#--------------------------------

  resources :customers, only: [:show, :destroy, :quit]  do
    member do
      get :quit
      patch :out
    end
  end
#----------items--------------
  root to: "items#top"
  get 'about' => 'items#about'
  get 'search' => 'items#search', as: 'genre_search'
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]

#----------cart_items-----------------
  resources :cart_items, only: [:index, :update, :destroy]
  # post '/add_item' => 'cart_items#add_item'
  # post '/update_item' => 'cart_items#update_item'
  # delete '/delete_item' => 'cart_items#delete_item'
  get '/all_item' => 'cart_items#all_item'
  delete '/all_item' => 'cart_items#all_item'
#--------------------------------

#----------Orders-----------------
  resources :orders,only: [:new,:index,:show,:create] do
    collection do
      post 'log'
      get 'thanx'
    end
  end
#--------------------------------



#----------genres--------------
  resources :genres, only: [:index, :create, :show, :edit, :update, :destroy]
#--------------------------------
end