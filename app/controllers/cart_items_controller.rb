class CartItemsController < ApplicationController
  #before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  #user.idとpuroduct.idを持ったデータを保存したい

  def index
    @cart_items = CartItem.all
    #@cart_items = current_cart
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_back(fallback_locaction: root_path)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def all_item
    # if @cart_item.blank?
      # @cart_item = current_cart.build(item_id: params[:item_id])


    # @cart_item.amount += params[:amount].to_i
    # if @cart_item.save
    #   redirect_to cart_items_path
    # else
    #   redirect_back(fallback_location: root_path)
    # end
  end

  # def update_item
  #   @cart_item.update(amount: params[:amount].to_i)
  #   redirect_to ''
  # end

  # def delete_item
  #   @cart_item.destroy
  #   redirect_to ''
  # end


  private

  def setup_cart_item!
    @cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
  end


end
