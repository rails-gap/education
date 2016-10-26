class Admin::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :admin_access?
  before_action :load_entity_object, only: [:edit, :update]
  before_action :load_all_entity_objects, only: [:index, :update]

  def update
    @user.update(entity_parameters)
  end

  private

  def entity_parameters
    params.require(:user).permit(:admin)
  end

  def load_entity_object
    @user = User.find(params[:id])
  end

  def load_all_entity_objects
    @users = User.order(:name)
  end

end
