Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_app_secret,
  token_params: { parse: :json },
  scope: 'email,public_profile',
  info_fields: 'email,first_name,last_name,picture,name',
  callback_url: 'http://localhost:3000/users/auth/facebook/callback'
end
