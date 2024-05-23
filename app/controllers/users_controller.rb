class UsersController < ApplicationController
  skip_before_action :require_login
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to experiences_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      @user.save
    else
      render :edit
    end
  end

  def destroy
    @user.destroy!

    redirect_to root_path, status: :see_other
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, profile_attributes: [:self_introduce, :image])
    end
end
