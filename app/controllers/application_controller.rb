class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to unauthenticated_root_path, notice: I18n.t('error.unauthorized')
    end
  end

  def admin_access?
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

end
