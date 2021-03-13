class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product(@product), notice: "You have created book successfully."
    else
      redirect_to product(@product), notice: "You have created book successfully."
    end
  end

  def log
  end

  def new
  end

  def show
  end

  def thanks
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :non_taxed_price, :sales_status)
    end

end
