class OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).per(10)
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
    def log
    @cart_items = current_customer.cart_item
		@order = Order.new(
      customer: current_customer,
      payment_method: params[:order][:payment_method]
    )

    # total_priceに請求額を代入
    @order.total_price = billing(@order)

    # addressにresidenceの値がはいっていれば
    if params[:order][:addresses] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address     = current_customer.residence
      @order.name        = current_customer.last_name +
                           current_customer.first_name

    # addressにshipping_addressesの値がはいっていれば
    elsif params[:order][:addresses] == "shipping_addresses"
      ship = ShippingAddress.find(params[:order][:shipping_address_id])
      @order.postal_code = ship.postal_code
      @order.address     = ship.address
      @order.name        = ship.name

    # addressにnew_addressの値がはいっていれば
    elsif params[:order][:addresses] == "new_address"
      @order.postal_code = params[:order][:postal_code]
      @order.address     = params[:order][:address]
      @order.name        = params[:order][:name]
      @ship = "1"

      # バリデーションがあるならエラーメッセージを表示
      unless @order.valid? == true
        @shipping_addresses = ShippingAddress.where(customer: current_customer)
        render :new
      end
    end
	end
  end

  def new
    @order = Order.new
    @addresses = Address.where(customer: current_customer)
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
