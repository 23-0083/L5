class ProfilesController < ApplicationController
  before_action :require_login
  before_action :set_profile, only: [:show, :edit, :update]

  def show
    redirect_to new_profile_path if @profile.nil?
  end

  def new
    if @current_user.profile
      redirect_to profile_path
    else
      @profile = @current_user.build_profile
    end
  end

  def create
    @profile = @current_user.build_profile(profile_params)
    if @profile.save
      redirect_to profile_path, notice: "プロフィールを登録しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    redirect_to new_profile_path if @profile.nil?
  end

  def update
    if @profile.nil?
      redirect_to new_profile_path
    elsif @profile.update(profile_params)
      redirect_to profile_path, notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def require_login
    @current_user = User.find_by(uid: session[:login_uid])
    redirect_to top_login_form_path, alert: "ログインしてください" unless @current_user
  end

  def set_profile
    @profile = @current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:message)
  end
end