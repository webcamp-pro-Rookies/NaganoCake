class CustomerController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
  end
end
