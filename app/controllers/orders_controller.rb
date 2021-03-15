class OrdersController < ApplicationController
  def index
    @orders = current_customer.orders
    @order = Order.find_by(params[:id]).order_details.find_by(params[:id])

  end

  def log
    @order = Customer.order
  end

  def new
  end

  def show
    @order = Order.find_by(params[:id])
    @price_in_tax = @order.order_details.find(params[:id]).price_in_tax
    @total_price = @price_in_tax + @order.shipping_cost
    # @orders =  current_customer.orders.where(params[:id])

  end

  def thanks
  end
end
