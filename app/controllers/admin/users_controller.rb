class Admin::UsersController < Admin::BaseController

  before_action :find_user, only: [:change_status, :change_role]

  def index
    @users = User.order(:username).page params[:page]
  end

  def change_status
    if @user.enable?
      @user.disable!, notice: "User is Disabled" 
    else
      @user.enable!, notice: "User is Enabled"
    end
    return(redirect_to admin_users_path)
  end

  def change_role
    if @user.user?
      @user.manager!, notice: "User has been assigned as Manager"
    else
      @user.user!, notice: "User has been removed as Manager"
    end
    return(redirect_to admin_users_path)
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

end
