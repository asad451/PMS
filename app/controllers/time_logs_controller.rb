class TimeLogsController < ApplicationController

  before_action :find_projects, only: [:new, :edit, :create, :update]
  before_action :find_timelog, only: [:edit, :update, :destroy]

  def index
    @timelogs = TimeLog.all
  end

  def new
    @timelog = TimeLog.new
  end

  def create
    @timelog = TimeLog.new(timelog_params)
    @timelog.user = current_user
    if @timelog.save
      redirect_to time_logs_path, notice: "Time Log created successfully!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @timelog.update(timelog_params)
      redirect_to time_logs_path, notice: "Time Log updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @timelog.destroy
    redirect_to time_logs_path, notice: "Time Log deleted successfully!"
  end

  private

    def timelog_params
      params.require(:time_log).permit(:project_id, :start_time, :end_time)
    end

    def find_timelog
      @timelog = TimeLog.find(params[:id])
    end

    def find_projects
      @projects = Project.pluck(:title, :id)
    end

end
