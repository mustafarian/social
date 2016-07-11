class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.'
    else
      redirect_to post_path(@comment.post_id), alert: 'Error creating comment.'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    if(@comment.post.user != current_user)
      redirect_to post_path(@comment.post_id), alert: 'Illegal comment deletion.'
      return
    end

    if @comment.destroy
      redirect_to post_path(@comment.post_id), notice: 'Comment deleted.'
    else
      redirect_to post_path(@comment.post_id), alert: 'Failed to delete comment.'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
