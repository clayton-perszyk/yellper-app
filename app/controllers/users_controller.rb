class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.username} created successfully!"
      redirect_to @user
    else
      flash.now[:notice] = "Problem saving #{@user.username}"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      flash[:success] = "#{@user.username} updated successfully!"
      redirect_to @user
    else
      flash[:notice] = "Problem updating #{@user.username}"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.username} deleted."
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :location, :password, :password_token, :password_digest, :image)
  end
end
