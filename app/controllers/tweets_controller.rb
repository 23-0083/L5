
class TweetsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy]

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    user = User.find_by(uid: session[:login_uid])
    @tweet = user.tweets.build(message: params.dig(:tweet, :message))

    if @tweet.save
      redirect_to tweets_path, notice: "ツイートを投稿しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "ツイートを削除しました"
  end

  private

  def require_login
    unless User.exists?(uid: session[:login_uid])
      redirect_to top_login_form_path, alert: "ログインしてください"
    end
  end
end
