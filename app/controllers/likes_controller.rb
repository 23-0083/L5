class LikesController < ApplicationController
  before_action :require_login

  def create
    tweet = Tweet.find(params[:tweet_id])
    user = User.find_by!(uid: session[:login_uid])

    user.likes.find_or_create_by(tweet: tweet)
    redirect_to tweets_path
  end

  def destroy
    tweet = Tweet.find(params[:id])
    user = User.find_by!(uid: session[:login_uid])

    user.likes.find_by(tweet: tweet)&.destroy
    redirect_to tweets_path
  end

  private

  def require_login
    unless User.exists?(uid: session[:login_uid])
      redirect_to top_login_form_path, alert: "ログインしてください"
    end
  end
end