class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
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
