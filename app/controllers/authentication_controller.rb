class AuthenticationController < Devise::OmniauthCallbacksController

  def google_oauth2
    user ? authorize : no_authorize('Please sign in with your GAP account.')
  end

  private

  def user
    @user ||= find_user_by_email || find_user_by_provider
  end

  def find_user_by_provider
    User.where(provider: auth.provider, uid: auth.uid).first_or_create
  end

  def find_user_by_email
    User.where(email: auth.info.email).first
  end

  def authorize
    update_login_info
    update_user_info
    sign_in_and_redirect user, event: :authentication
  end

  def update_login_info
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.save
  end

  def update_user_info
    user.name = auth.info.name
    user.picture = auth.extra.raw_info.picture
    user.image = auth.info.image
    user.save
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def no_authorize(message)
    flash[:error] = message
    redirect_to root_path
  end

end
