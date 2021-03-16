class CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def quit
    @customer = Customer.find(params[:id])
  end
  
  def out
    @customer = Customer.find(params[:id])
    @customer.update(user_status: false)
    reset_session
    redirect_to root_path, notice: "退会しました またのご利用お待ちしております"
  end
end
