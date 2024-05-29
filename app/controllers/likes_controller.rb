class LikesController < ApplicationController
  before_action :require_login

  def create
    @experience = Experience.find(params[:experience_id])
    @like = current_user.likes.new(experience_id: @experience.id)
    @like.save
    render turbo_stream: turbo_stream.update("like-button-for-experience-#{@experience.id}", partial: 'like/unlike', locals: { experience: @experience })
  end

  def destroy
    @experience = Experience.find(params[:experience_id])
    @like = Like.find_by(experience_id: @experience.id, user_id: current_user.id)
    @like.destroy
    render turbo_stream: turbo_stream.update("like-button-for-experience-#{@experience.id}", partial: 'like/like', locals: { experience: @experience })
  end
end
