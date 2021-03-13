class CategoriesController < ApplicationController
  def index
    @categories = Category.all.page(params[:page]).per(10)
    @category_new = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to categories_path
    else
      @categories = Category.all.page(params[:page]).per(10)
      render :index and return
    end
  end

  def show
  end

  def edit
    @category = Category.find(params[:id])
    #unless user == admin_user
    #redirect_to どこかの_path
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    redirect_to categories_path
    
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private
    def category_params
    params.require(:category).permit(:category_name)
  end

end
