class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters

    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])

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

  end

end
