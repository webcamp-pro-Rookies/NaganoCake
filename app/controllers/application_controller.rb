class ApplicationController < ActionController::Base

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [
    :email,
    :name,
    :postcode,
    :prefecture_name,
    :address_city,
    :address_street,
    :address_building
  ])
end

end
