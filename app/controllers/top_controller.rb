
class TopController < ApplicationController
  def main
    redirect_to tweets_path
  end

  def login_form
  end

  def login
    user = User.find_by(uid: params[:uid])

    if user && user.authenticate(params[:password])
      reset_session
      session[:login_uid] = user.uid
      redirect_to tweets_path, notice: "ログインしました"
    else
      flash.now[:alert] = "ユーザIDまたはパスワードが違います"
      render :login_form, status: :unprocessable_entity
    end
  end

  def logout
    reset_session
    redirect_to tweets_path, notice: "ログアウトしました"
  end
end
