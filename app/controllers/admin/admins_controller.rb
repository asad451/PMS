class Admin::AdminsController < Admin::BaseController

  def index
    @users = User.all
  end

  def user_status
    user = User.find(params[:id])
    if user.enable?
      user.disable!
      sleep 1.5
      redirect_to admin_root_path and return
    else
      user.enable!
      sleep 1.5
      redirect_to admin_root_path and return
    end  
  end

end
