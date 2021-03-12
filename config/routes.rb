Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :destroy, :quit]
#----------Products--------------
  root to: "products#top"
  get 'about' => 'products#about'
  resources :products, only: [:index, :show]
#--------------------------------
#----------Shipping_address--------------
  resources :shipping_addresses, only: [:index, :create, :edit, :destroy]
#--------------------------------
end