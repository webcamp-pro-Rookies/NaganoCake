Rails.application.routes.draw do
  
  devise_for :users
#----------Products--------------
  root to: "products#top" 
  get 'about' => 'products#about'
resources :products, only: [:index, :show]
#--------------------------------
  
end
