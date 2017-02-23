class AuthenticationController < Devise::OmniauthCallbacksController

  def google_oauth2
    valid_user? ? authorize : no_authorize(I18n.t('error.unauthorized'))
  end

  private

  def valid_user?
    user && user.valid?
  end

  def user
    @user ||= find_user_by_email || find_user_by_provider
  end

  def find_user_by_provider
    User.where(provider: auth.provider, uid: auth.uid, email: auth.info.email).first_or_create
  end

  def find_user_by_email
    User.where(email: auth.info.email).first
  end

  def authorize
    user.update_attributes(user_info)
    sign_in_and_redirect user, event: :authentication
  end

  def user_info
    {
      provider: auth.provider,
      uid: auth.uid,
      email: auth_info.email,
      password: fake_password,
      name: auth_info.name,
      image: auth_info.image,
      picture: auth.extra.raw_info.picture
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def auth_info
    @auth_info ||= auth.info
  end

  def fake_password
    Devise.friendly_token[0, 20]
  end

  def no_authorize(message)
    flash[:error] = message
    redirect_to root_path
  end

end
