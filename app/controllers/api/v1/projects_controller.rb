class Api::V1::ProjectsController < ApiController

  before_action :find_project, only: [:show]

  def index
    @project = Project.perform_search(params.merge!(no_pagination: true))
    render json: @project
  end

  def show
    render json: @project
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

end
