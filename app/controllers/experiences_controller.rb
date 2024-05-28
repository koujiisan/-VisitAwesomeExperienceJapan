class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[ show edit update destroy ]
  before_action :set_current_user

  def index
    @experiences = Experience.all.order(created_at: :desc)
  end

  def show
    @experience = Experience.find(params[:id])
    @comments = @experience.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  def new
    @experience = Experience.new
  end

  def edit
  end

  def create
    @experience = current_user.experiences.build(experience_params)
    if @experience.save
      redirect_to experiences_path, notice: "Experience was successfully created."
    else
      render :new, status: :unprocessable_entity
      end
  end

  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to experience_url(@experience), notice: "Experience was successfully updated." }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @experience.destroy!
    redirect_to experiences_path, status: :see_other
  end

  private
    def set_experience
      @experience = Experience.find(params[:id])
    end

    def experience_params
      params.require(:experience).permit(:title, :description, :tag, :time, :cost, :image)
    end

    def set_current_user
      @user = current_user
    end
end
