class CartItemsController < ApplicationController
  #before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]
  #user.idとpuroduct.idを持ったデータを保存したい

  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_item = CartItem.new
  end



  def create

    if @already_cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id]) # 既にカードに追加済みの商品には更新処理
      @already_cart_item.update(amount: params[:cart_item][:amount])
      redirect_to cart_items_path
    else
      @new_art_item = CartItem.create(customer_id: current_customer.id, item_id: params[:cart_item][:item_id], amount: params[:cart_item][:mount]) # 新規カート追加の商品は新規追加処理
      redirect_to cart_items_path
    end

  end


  # params[:cart_item][:item_id]

  def update

    @cart_item = CartItem.find(params[:id])
    @cart_item.update(amount: params[:cart_item][:amount])
    @cart_item.save

    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_back(fallback_location: root_path)
  end

  def all_item
    @cart_items = Customer.find_by(params[:id]).cart_items.where(params[:id])
    @cart_items.destroy_all
    redirect_back(fallback_location: root_path)
  end

  # def add_item
    # if @cart_item.blank?
      # @cart_item = current_cart.build(item_id: params[:item_id])


    # @cart_item.amount += params[:amount].to_i
    # if @cart_item.save
    #   redirect_to cart_items_path
    # else
    #   redirect_back(fallback_location: root_path)
    # end
  # end

  # def update_item
  #   @cart_item.update(amount: params[:amount].to_i)
  #   redirect_to ''
  # end

  # def delete_item
  #   @cart_item.destroy
  #   redirect_to ''
  # end


  private

  def cart_item_params
    params.require(:cart_item).permit(:amount)
  end


end
