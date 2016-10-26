class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to root_path, notice: 'Please sign in with your GAP account.'
    end
  end

  def admin_access?
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

end
