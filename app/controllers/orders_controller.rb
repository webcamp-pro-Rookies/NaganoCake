class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    @order = Order.find_by(params[:id]).ordered_products.find_by(params[:id])

  end

  def log
    @order = User.order
  end

  def new
  end

  def show
    @order = Order.find_by(params[:id])
    @price_in_tax = @order.ordered_products.find(params[:id]).price_in_tax
    @total_price = @price_in_tax + @order.shipping
    # @orders =  current_user.orders.where(params[:id])

  end

  def thanks
  end
end
