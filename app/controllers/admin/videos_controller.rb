class Admin::VideosController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :admin_access?

  private

  def entity_parameters
    params.require(:video).permit(:title, :link, :description, :presenter, :active, :tags, :year)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:video_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.order(:title)
  end

end
