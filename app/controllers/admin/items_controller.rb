class Admin::ItemsController < ApplicationController

  def top
    @items = Item.all.page(params[:page]).per(4)
  end

  def index
    @items = Item.all.page(params[:page]).per(8)
  end

  def search
    @items = Item.where(genre_id: params[:genre_id]).page(params[:page]).per(8)
    render "index"
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item.id)
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item =CartItem.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render "edit"
    end
  end

  def log
  end

  def thanks
  end

  private

    def item_params
      params.require(:item).permit(:name, :introduction, :price, :image, :is_active, :genre_id)
    end


end
