class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def new
    @profile = current_user.build_profile
  end

  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      redirect_to @profile.user, notice: 'Profile was successfully created.'
    else
      render :edit
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile.user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:self_introduce, :image)
  end
end
