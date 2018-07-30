class HomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @user = User.all
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

end
