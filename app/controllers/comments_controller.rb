class CommentsController < ApplicationController
  before_action :require_login
  before_action :set_experience

  def create
    @comment = @experience.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @experience, notice: 'コメントが投稿されました'
    else
      render 'experiences/show'
    end
  end

  private

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
