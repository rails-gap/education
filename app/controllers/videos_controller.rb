class VideosController < ApplicationController
  add_breadcrumb 'Videos', :videos_path

  before_action :authenticate_user!

  def index
    @videos = params[:search] ? load_search_videos : load_all_videos
  end

  def show
    @video = Video.active.find(params[:id])
    add_breadcrumb @video.title, video_path(@video)
  end

  private

  def load_all_videos
    Video.active.paginate(page: params[:page])
  end

  def load_search_videos
    Video.search(params[:search]).paginate(page: params[:page])
  end

end
