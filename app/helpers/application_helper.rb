module ApplicationHelper

  def current_cart
    @cart_items = current_customer.cart_items
  end

    # 請求額の計算 orders/logで使用
  def billing(order)
    total_price(current_cart) + order.postage
  end


end
