# This module handles all shared CRUD.
module DefaultCrud
  extend ActiveSupport::Concern

  included do
    before_action :load_entity_object, only: [:show, :edit, :update, :destroy]
    before_action :load_all_entity_objects, only: [:index, :create, :update, :destroy]
    before_action :load_entity_object_by_id, only: [:delete]
  end

  def new
    @entity_object = entity.new
  end

  def create
    @entity_object = entity.create(entity_parameters)
  end

  def update
    @entity_object.update(entity_parameters)
  end

  def destroy
    @entity_object.destroy
  end

  private

  def load_entity_object
    @entity_object = entity.find(params[:id])
  end

  def load_all_entity_objects
    @all_entity_objects = entity.order(:name)
  end

  def entity
    @entity ||= controller_name.constantize
  end

  def controller_name
    self.class.to_s.split('::').last.gsub('Controller', '').singularize.to_s
  end

  def entity_parameters
    fail 'Strong Parameters should be declared in corresponding controllers'
  end

end
