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
      redirect_to user_teams_path(@user)
    else
      redirect_to '/signup'
    end
  end

  def attempt_login
  end

  def logout
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :password_digest, :location, :image)
  end
end
