class Admin::CategoriesController < ApplicationController
  include DefaultCrud

  before_action :authenticate_user!
  before_action :admin_access?

  private

  def entity_parameters
    params
      .require(:category)
      .permit(:name)
  end

  def load_entity_object_by_id
    @entity_object = entity.find(params[:category_id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.order(:name)
  end

end
