class ProjectsController < ApplicationController

  before_action :find_project, only: [:show]

  def index
    @projects = Project.order(:title).page params[:page]
    @results = Project.search(params[:search])
  end

  def show
    @total = TimeLog.where(user: current_user, project: @project).map{ |t| (t.end_time - t.start_time) / 3600 }.sum
    @comments = @project.comments.includes(:user).order("created_at desc").limit(5)
  end

  private

    def find_project
      @project = Project.find(params[:id])
    end

end
