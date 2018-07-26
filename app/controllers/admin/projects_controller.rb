class Admin::ProjectsController < Admin::BaseController

  before_action :get_clients, only: [:new, :edit]
  before_action :find_project, only: [:edit, :update, :show, :destroy]

  def index
    @projects = Project.order(:title).page params[:page]
  end

  def new
    @project = Project.new
  end

  def create
    @clients = Client.all
    @project = Project.new(project_params)
    if @project.save
      redirect_to admin_projects_path, notice: "Project created successfully!"
    else
      get_clients
      render 'new'
    end
  end

  def edit
    render 'edit'
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_path, notice: "Project updated successfully!"
    else
      get_clients
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    redirect_to admin_projects_path, notice: "Project deleted successfully!"
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:client_id, :title, :description, :price, :time)
    end

    def get_clients
      @clients = Client.pluck(:name, :id)
    end

end
