class Admin::CommentsController < Admin::BaseController

  before_action :find_project
  before_action :find_comment

  def destroy
    @comment.destroy
    redirect_to admin_project_path(@project), notice: "Comment deleted successfully!"
  end

    def find_project
      @project = Project.find(params[:project_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

end
