class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to product_path(@product)
    else
      render "new"
    end

  end

  def show
  end

  def log
  end

  def show
  end

  def thanks
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :non_taxed_price)
    end

    # , :image, :sales_status

end
