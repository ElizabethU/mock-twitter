class TweetsController < ApplicationController
  before_action :set_tweet, only: [ :show ]


  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to tweet_show_path(@tweet)
    else
      render action: new
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def index
    @tweets = Tweet.order("created_at" "desc")
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:user, :message)
  end
end
