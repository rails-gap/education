class AuthenticationController < Devise::OmniauthCallbacksController

  def google_oauth2
    user ? authorize : no_authorize('Please sign in with your GAP account.')
  end

  private

  def user
    @user ||= User.where(provider: auth.provider, uid: auth.uid).first_or_create
  end

  def authorize
    update_user
    sign_in_and_redirect user, event: :authentication
  end

  def update_user
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.name = auth.info.name
    user.password = Devise.friendly_token[0, 20]
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