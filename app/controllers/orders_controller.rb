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
    #@cart_items = current_customer.cart_items
    @cart_items = CartItem.all 
    
		@order = Order.new

  end

  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    #@price_in_tax = @order.order_details.find(params[:id]).price_in_tax
    #@total_price = @price_in_tax + @order.shipping_cost
    # @orders =  current_customer.orders.where(params[:id])

  end

  def thanks
  end
  
  def order_params
		  params.require(:order).permit(:order_status)
	end
end
