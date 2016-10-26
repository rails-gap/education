class VideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.active.paginate(page: params[:page])
  end

  def show
    @video = Video.active.find(params[:id])
  end

end
