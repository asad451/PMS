class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = UserProvider.find_or_create_for_facebook_oauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
