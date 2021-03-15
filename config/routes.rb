Rails.application.routes.draw do
  devise_for :admins
  devise_for :users,
    controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :destroy, :quit]
  get 'auit/:id' => 'users#quit'
  patch 'out/:id' => 'users#out'
#----------Products--------------
  root to: "products#top"
  get 'about' => 'products#about'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]

#----------Carts-----------------
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



#----------categories--------------
resources :categories, only: [:index, :create, :show, :edit, :update, :destroy]
#--------------------------------


#----------Shipping_address--------------
  resources :shipping_addresses, only: [:index, :create, :edit, :update, :destroy]
#--------------------------------
end