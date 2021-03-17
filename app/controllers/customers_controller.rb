class CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(current_customer.id)
  end
  
  
  def quit
    @customer = Customer.find(current_customer.id)
  end
  
  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会しました またのご利用お待ちしております"
  end
end
