class AddressesController < ApplicationController

  def index
    @customer = Customer.find(params[:customer_id])
    @addresses = @customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to customer_addresses_path

    else
      # redirect_to customer_addresses_path
      # binding.pry
      render 'index'
    end
  end

  # def new
  # end

  # def create
  #   @address = Address.new(address_params)
  #   @address.user_id = current_user.id
  #   @address.save
  #   redirect_to addresses_path
  # end

  # def edit
  #   @address = Address.find(params[:id])
  # end

  # def update
  #   @address = Address.find(params[:id])
  #   @address.customer_id = current_customer.id
  #   if @address.update(address_params)
  #     redirect_to addresses_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @address = Address.find(params[:id])
  #   @address.destroy
  #   redirect_to addresses_path
  # end

  private

  def address_params
    params.require(:address).permit(
      :name,
      :postal_code,
      :address
      )
  end

end
