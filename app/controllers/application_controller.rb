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
    # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
    current_cart = CartItem.find_by(id: session[:product_id])
    # Cart情報が存在しない場合、@current_cartを作成
    current_cart = CartItem.create unless current_cart
    # 取得したCart情報よりIDを取得し、セッションに設定
    session[:product_id] = current_cart.id
    # Cart情報を返却
    current_cart
  end
   #------------------------------


  def after_sign_in_path_for(recource)
    user_path(current_user.id)
  end
end
