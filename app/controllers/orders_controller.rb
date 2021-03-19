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
    @order = Order.where(customer_id: current_customer.id).last

		# @order = Order.new(
		#   customer: current_customer,
		#   payment_metod: params[:order][:payment_method]
		#   )
		# if params[:order][:addresses] == "home"
		#   @order.postal_code = current_customer.postal_code
		#   @order.address     = current_customer.address
		#   @order.name        = current_customer.last_name +
		#                       current_customer.first_name

  #   elsif params[:order][:addresses] == "addresses"
  #     ship = Addresses.find(params[:order][:address_id])
  #     @order.postal_code = ship.postal_code
		#   @order.address     = ship.address
		#   @order.name        = ship.name

		# else
		#   @order.postal_code = params[:order][:postal_code]
		#   @order.address     = params[:order][:address]
		#   @order.name        = params[:order][:name]
		#   @ship = "1"
		# end

		# @order_new = Order.new
  end

  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.where(customer: current_customer)

    @total_payment = params[:total_payment]
  end

    # t.integer "customer_id" クリア
    # # t.integer "total_payment"
    # t.integer "payment_method", default: 0
    # t.integer "shipping_cost" クリア
    # t.integer "status", default: 0

    # a = current_customer.items.pluck(:price)

    # b = current_customer.cart_items.pluck(:amount)

    # c = a.map { |x| x * a[1..a.length]}

  def create
    price_array = current_customer.items.pluck(:price)
    num_array = current_customer.cart_items.pluck(:amount)
    pay_amount = Order.total_amount_calculator(price_array, num_array)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.total_payment = pay_amount
    @order.shipping_cost = 800

    if params[:order][:addresses] == "home"
      @order.address = current_customer.address
      @order.name = current_customer.last_name
      @order.postal_code = current_customer.postal_code
    end

    if @order.save
      @cart_items = current_customer.cart_items
      # render :log
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
