Rails.application.routes.draw do
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
  }
  devise_for :admins,:controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/registrations',
   }

#----------customer--------------
  resources :customers, only: [:index, :show, :new, :create, :edit, :update, :destroy]
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

#----------Products--------------
  root to: "products#top"
  get 'about' => 'products#about'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]

#----------cart_items-----------------
  resources :cart_items, only: [:index]
  post '/add_item' => 'cart_items#add_item'
  post '/update_item' => 'cart_items#update_item'
  delete '/delete_item' => 'cart_items#delete_item'
#--------------------------------

#----------Orders-----------------
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :show, :new,]
  get 'orders/log' => 'orders#log'
#--------------------------------



#----------genres--------------
  resources :genres, only: [:index, :create, :show, :edit, :update, :destroy]
#--------------------------------


#----------addresses--------------
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
#--------------------------------
end