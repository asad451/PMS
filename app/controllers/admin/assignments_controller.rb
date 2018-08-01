class Admin::AssignmentsController < Admin::BaseController

  before_action :find_project, only: [:new, :create, :destroy]
  before_action :find_users, only: [:new, :edit, :create, :update]
  before_action :find_assignment, only: [:edit, :update, :destroy]

  def new
    @assignment = @project.assignments.new
  end

  def create
    @assignment = @project.assignments.new(assignment_params)
    if @assignment.save
      redirect_to admin_project_path(@project), notice: "User Assigned successfully!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to admin_project_path(@assignment.project), notice: "Assignment updated successfully!"
    else
      render 'edit'
    end
  end

  def destroy
    @assignment.destroy
    redirect_to admin_project_path(@project), notice: "Assignment deleted successfully!"
  end

  private

    def assignment_params
      params.require(:assignment).permit(:role, :user_id)
    end

    def find_assignment
      @assignment = Assignment.find(params[:id])
    end

    def find_users
      @users = User.enable_without_admin
    end

    def find_project
      @project = Project.find(params[:project_id])
    end

end
