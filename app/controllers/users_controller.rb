class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def quit
    @user = User.find(params[:id])
  end
  
  def out
    @user = User.find(params[:id])
    @user.update(user_status: false)
    reset_session
    redirect_to root_path, notice: "退会しました またのご利用お待ちしております"
  end
  
end
