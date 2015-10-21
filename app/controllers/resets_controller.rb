class ResetsController < ApplicationController
  before_action :prevent_login_signup, only: [:edit, :update]

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      ResetMailer.password_reset(user).deliver_now
      redirect_to login_path, notice: "email sent"
    else
      flash[:alert] = "Email not found"
      render :new
    end
  end

  def new
  end

  def edit
    @user = User.find_by(password_token: params[:id])
    if @user
    else
      redirect_to '/login', alert: "Invalid reset token"
    end
  end

  def update
    @user = User.find_by(password_token: params[:id])
    if params[:user][:password].present?
      if @user && @user.update(user_params)
        @user.update(password_token: nil)
        session[:user_id] = @user.id
        redirect_to user_path(@user), flash: {success: "Password updated!"}
      else
        flash.now[:notice] = "Password reset token not found."
        render :edit
      end
    else
      flash[:alert] = "Please enter a password"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:password)
  end
end
