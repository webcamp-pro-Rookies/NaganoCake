class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product.id)
    else
      render "new"
    end

  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render "edit"
    end
  end

  def log
  end

  def thanks
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :non_taxed_price, :image, :sales_status)
    end

end
