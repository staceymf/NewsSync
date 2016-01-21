class FeedsController < ApplicationController
  def index
    @feeds = Feed.all.where(userid: params[:userid])
    render json: @feeds
  end

  def show
  end

  def new
  end

  def create
    @feed = build(create_params)
    if @feed.save
      render json: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  private
  def create_params
    params.require(:feed).permit(:frequency, :userid)
  end
end
