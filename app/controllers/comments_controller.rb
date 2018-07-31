class CommentsController < ApplicationController

  before_action :find_commentable
  before_action :find_comment, only: [:destroy, :edit, :update]

  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: "Comment Posted Successfully"
    else
      redirect_to @commentable, alert: "Please enter a comment"
    end
  end

  def destroy
    if @comment.user = current_user
      @comment.destroy
      redirect_to @commentable, notice: "Comment deleted successfully!"
    else
      redirect_to @commentable, alert: "Cannot delete comment"
    end
  end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.js
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_commentable
      @commentable = Project.find(params[:project_id])
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end

end
