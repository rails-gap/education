class VideosController < ApplicationController
  add_breadcrumb 'Videos', :videos_path

  before_action :authenticate_user!

  def index
    @videos = Video.active.paginate(page: params[:page])
  end

  def show
    @video = Video.active.find(params[:id])
    add_breadcrumb @video.title, video_path(@video)
  end

end
