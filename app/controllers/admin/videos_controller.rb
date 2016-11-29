class Admin::VideosController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :admin_access?
  before_action :load_categories, only: [:new, :edit]
  before_action :load_events, only: [:new, :edit]

  private

  def entity_parameters
    params
      .require(:video)
      .permit(:title, :link, :description, :presenter, :active, :tags, :year, :date, :level,
        :category_id, :event_id)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:video_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.order(:title)
  end

  def load_categories
    @categories = Category.all
  end

  def load_events
    @events = Event.all
  end

end
