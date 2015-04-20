class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:danger] = "User destroy'd"
    else
      flash[:danger] = "User not destroy'd"
    end
    redirect_to admin_panel_path
  end

  private
  def user_params
    params.require(:user).permit(:login, :password, :password_confirmation)
  end
end
