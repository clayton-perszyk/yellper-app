class SessionsController < ApplicationController
  def signup
    @user = User.new
  end

  def login
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/signup'
    end
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(username: params[:username]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to home_path
      else
        flash[:alert] = "username / password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "please enter username and password"
      redirect_to login_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "You are logged out"
    redirect_to '/login'
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :location, :password, :password_token, :password_digest, :image)
  end
end
