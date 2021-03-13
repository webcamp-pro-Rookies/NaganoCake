Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :destroy, :quit]
#----------Products--------------
  root to: "products#top"
  get 'about' => 'products#about'
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]

#----------Carts-----------------
  resources :carts, only: [:index, :update, :create, :destroy]
  get 'destroy_all' => 'carts#destroy_all'
#--------------------------------

#----------Orders-----------------
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:index, :show, :new,]
  get 'orders/log' => 'orders#log'
#--------------------------------


#----------Shipping_address--------------
  resources :shipping_addresses, only: [:index, :create, :edit, :destroy]
#--------------------------------
end