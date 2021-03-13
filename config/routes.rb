Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :destroy, :quit]
#----------Products--------------
  root to: "products#top"
  get 'about' => 'products#about'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]

#----------Carts-----------------
resource :carts, only: [:show]
post '/add_item' => 'carts#add_item'
post '/update_item' => 'carts#update_item'
delete '/delete_item' => 'carts#delete_item'
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
  resources :shipping_addresses, only: [:index, :create, :edit, :destroy]
#--------------------------------
end