class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email,
      :ruby_last_name,
      :last_name,
      :ruby_first_name,
      :first_name,
      :phone_number,
      :postcode,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :ruby_last_name,
      :last_name,
      :ruby_first_name,
      :first_name,
      :phone_number,
      :postcode,
      :prefecture_code,
      :address_city,
      :address_street,
      :address_building,
    ])
  end

  #-------cartitem---------------
    def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
   #------------------------------


  def after_sign_in_path_for(recource)
    user_path(current_user.id)
  end
end
