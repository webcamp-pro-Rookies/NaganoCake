class OrdersController < ApplicationController

  def index
    @orders = current_customer.orders
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
    @order = Order.where(customer_id: current_customer.id).last
  end

  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
    @total_payment = params[:total_payment]
  end

  def create
    price_array = current_customer.items.pluck(:price)
    num_array = current_customer.cart_items.pluck(:amount)
    pay_amount = Order.total_amount_calculator(price_array, num_array)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_payment = pay_amount
    @order.shipping_cost = 800

    if params[:order][:addresses] == "home"
      #この書き方はストロングパラメータをまず見る
      #orderのadressersをパラメータ取得
      @order.address = current_customer.address
      @order.name = current_customer.last_name
      @order.postal_code = current_customer.postal_code
    end

    if params[:order][:addresses] == "addresses"
      @order.address = Address.find(params[:order][:address_id]).address
      @order.name = Address.find(params[:order][:address_id]).name
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
    end

    if @order.save
      @cart_items = current_customer.cart_items
      redirect_to log_orders_path(order: @order)
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
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
  end

  private

  def order_params
	  params.require(:order).permit(
	    :address,
	    :payment_method,
	    :name,
	    :postal_code,
	    )
  end

end
