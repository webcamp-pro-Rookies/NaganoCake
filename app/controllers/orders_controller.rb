class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order = Order.find_by(params[:id]).ordered_products.find_by(params[:id])

  end

  def log
    @order = User.order
  end

  def new
  end

  def show
    @order = User.order(current_user)
  end

  def thanks
  end
end
