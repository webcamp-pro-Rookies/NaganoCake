class ProductsController < ApplicationController

  def new
  end

  def create
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
      params.require(:product).permit(:image, :name, :description, :non_taxed_price, :sales_status)
    end

end
