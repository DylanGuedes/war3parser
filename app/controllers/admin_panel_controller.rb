class AdminPanelController < ApplicationController
  def index
    @users = User.all
    @admins = @users.where(admin: true)
    @replays = Replay.all
  end

  def turn_admin
    @user = User.find(params[:id])
    @user.admin = true
    if @user.save
      flash[:success] = "#{@user.login} is an admin now!"
    else
      flash[:danger] = "Error"
    end
    redirect_to admin_panel_path
  end
end
