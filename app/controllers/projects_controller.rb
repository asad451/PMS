class ProjectsController < ApplicationController

  before_action :find_project, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_role, only: [:new, :edit]

  def index
    @projects = Project.all
    @clients = Client.pluck(:name, :id)
  end

  def new
    @clients = Client.pluck(:name, :id)
    @project = Project.new
  end

  def create
    @clients = Client.all
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_root_path
    else
      render 'new'
    end
  end

  def edit
    @clients = Client.pluck(:name, :id)
    render 'edit'
  end

  def update
    if @project.update(project_params)
      redirect_to admin_root_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to admin_root_path
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:client_id, :title, :description, :price, :time)
    end

    def authenticate_role
      unless current_user.admin? || current_user.manager?
        return (redirect_to root_path, alert: 'You are not authorize to view this page')
      end
    end

end
