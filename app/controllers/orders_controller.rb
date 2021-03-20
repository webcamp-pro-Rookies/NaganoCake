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
    redirect_to new_order_path
  end

  def new
    @customer = current_customer
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
  end

  def create

    @order = Order.new(order_params)

    pay_amount = Order.total_amount_calculator(current_customer.cart_items)
    shipping_cost = 800

    @order.update(customer_id: current_customer.id, total_payment: pay_amount + shipping_cost, shipping_cost: shipping_cost)

    if params[:order][:address_selection] == "my_home"
      @order.address = current_customer.address
      @order.name = current_customer.last_name
      @order.postal_code = current_customer.postal_code
    end

    if params[:order][:address_selection] == "addresses"
      address = Address.find(params[:order][:address_id])
      @order.address = address.address
      @order.name = address.name
      @order.postal_code = address.postal_code
    end

    # binding.pry
    # test = "test"

    if @order.valid?
      @cart_items = current_customer.cart_items
      render 'log'
    else
      @customer = current_customer
      @addresses = Address.where(customer: current_customer)
      render :new
    end

  end


  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
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

    @cart_items = current_customer.items # ユーザーのカートに入っている商品の一覧を所得する
    @order = Order.new(order_params)
    @order.save

    @cart_items.each do |cart_item| # デフォルト値適当、まだまだ改善の余地あり。
    OrderDetail.create(item_id: cart_item.id, order_id: @order.id, amount: cart_item.cart_items[0].amount, making_status: 0, price: cart_item.price)
    end

    CartItem.where(customer_id: current_customer.id).destroy_all
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
	    :status,
	    :created_at,
	    :updated_at
	    )
  end

end