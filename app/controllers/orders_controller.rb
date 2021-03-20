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
  end

  def create

    @order = Order.new(order_params)

    pay_amount = Order.total_amount_calculator(current_customer.cart_items)
    @order.update(customer_id: current_customer.id, total_payment: pay_amount, shipping_cost: 800)

    if params[:order][:address_selection] == "my_home"
      @order.update(address: current_customer.address, name: current_customer.last_name, postal_code: current_customer.postal_code)
    end

    if params[:order][:address_selection] == "addresses"
      address = Address.find(params[:order][:address_id])
      @order.update(address: address.address, name: address.name, postal_code: address.postal_code)
    end

    if @order.save
      @cart_items = current_customer.cart_items
      redirect_to log_orders_path(order: @order)
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
    @order = Order.find(params[:order][:order_id])

    @cart_items.each do |cart_item| # デフォルト値適当、まだまだ改善の余地あり。
    order_detail = OrderDetail.new(item_id: cart_item.id, order_id: @order.id, amount: cart_item.cart_items[0].amount, making_status: 0, price: cart_item.price)
    order_detail.save
    end

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
