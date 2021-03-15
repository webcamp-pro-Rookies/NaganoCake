class Users::SessionsController < Devise::SessionsController
  
  before_action :reject_inactive_user, only: [:create]
  
  def reject_inactive_user
    @user = User.find_by(email: params[:user][:email].downcase)
    if @user
      if @user.valid_password?(params[:user][:password]) && !@user.user_status
        redirect_to new_user_session_path
      end
    end
  end
end