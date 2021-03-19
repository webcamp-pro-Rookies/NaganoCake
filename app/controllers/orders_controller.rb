class OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
    #orderモデルのデータをすべて持ってきている。10項目づつ表示
  end

  def current_index
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10)
    render :index
  end

  def today_order_index
    now = Time.current
    @orders = Order.where(created_at: now.all_day).page(params[:page]).per(10)
    render :index
  end

  def log
    @cart_items = current_customer.cart_items
		@order = current_customer.orders.find_by(params[:id])
		@order_new = Order.new
  end

  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to log_orders_path
    else
      render :new
    end
  end


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #@price_in_tax = @order.order_details.find(params[:id]).price_in_tax
    #@total_price = @price_in_tax + @order.shipping_cost
    #@orders =  current_customer.orders.where(params[:id])
  end

  def update
    @order = current_customer.orders
    if @order.update()
      redirect_to log_orders_path
    else
      render :new
    end
  end

  def completed
    @order = Order.new
    @order.save
    redirect_to '/orders/thanks'
  end

  def thanks
  end

  private

  def order_params
	  params.require(:order).permit(
	    :customer_id,
	    :address,
	    :total_payment,
	    :payment_method,
	    :name,
	    :postal_code,
	    :shipping_cost,
	    :status
	    )
  end

end
