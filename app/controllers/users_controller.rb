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
  end
  
end
