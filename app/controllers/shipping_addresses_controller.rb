class ShippingAddressesController < ApplicationController

  def index
  end

  def create
  end

  def edit
  end

  def destroy
  end



  def configure_permitted_parameters
    shipping_address_parameter_sanitizer.permit(
      :user_id,
      :destination_name,
      :postcode,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_build
    )
  end

end
