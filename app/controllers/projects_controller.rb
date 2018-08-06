class ProjectsController < ApplicationController

  before_action :find_project, only: [:show]

  def index
    @results = Project.search(params[:search]).page params[:page]
  end

  def show
    @total = TimeLog.where(user: current_user, project: @project).map{ |t| (t.end_time - t.start_time) / 3600 }.sum
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

end
