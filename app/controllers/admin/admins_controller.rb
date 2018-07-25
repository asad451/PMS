class Admin::AdminsController < Admin::BaseController

  before_action :find_user, only: [:change_status, :change_role]

  def index
    @users = User.all
    @clients = Client.all
    @projects = Project.all
  end

  def change_status
    if @user.enable?
      @user.disable!
    else
      @user.enable!
    end
      return(redirect_to admin_root_path)
  end

  def change_role
    if @user.user?
      @user.manager!
    else
      @user.user!
    end
      return(redirect_to admin_root_path)
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

end
