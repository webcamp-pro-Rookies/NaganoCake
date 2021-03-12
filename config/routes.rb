Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
  resources :users, only: [:show, :destroy, :quit]
#----------Products--------------
  root to: "products#top" 
  get 'about' => 'products#about'
  resources :products, only: [:index, :show]
#--------------------------------
#----------Cartlls-----------------
  resources :carts, only: [:index, :update, :create, :destroy, :destroy_all]
  
end