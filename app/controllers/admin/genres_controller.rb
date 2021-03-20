class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all.page(params[:page]).per(10)
    @genre_new = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admin_genres_path
    else
      flash[:alert] = "ジャンル名を入力してください"
      redirect_back(fallback_location: root_path)
    end
  end

  def show
  end

  def edit
    @genre = Genre.find(params[:id])
    #unless user == admin_user
    #redirect_to どこかの_path
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to admin_genres_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
