class Admin::AdminsController < Admin::BaseController

  def index
    @users = User.all
    @clients = Client.all
  end

  def user_status
    user = User.find(params[:id])
    if user.enable?
      user.disable!
      sleep 1
      redirect_to admin_root_path and return
    elsif user.user?
      user.manager!
      sleep 1
      redirect_to admin_root_path and return
    elsif user.manager?
      user.user!
      sleep 1
      redirect_to admin_root_path and return
    else
      user.enable!
      sleep 1
      redirect_to admin_root_path and return
    end  
  end
end
