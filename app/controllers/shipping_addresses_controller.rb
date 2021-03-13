class ShippingAddressesController < ApplicationController

  def index
    # @shipping_addresses = current_user.shipping_address
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    # @shipping_address = ShippingAddress.find_by(params[:id])
    @shipping_address.save
    redirect_to shipping_addresses_path
  end

  def edit
    @shipping_address = ShippingAddress(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to shipping_addresses_path(@shipping_address)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(
      :destination_name,
      :postcode,
      :prefecture_name,
      :address_city,
      :address_street,
      :address_building
      )
  end

end
