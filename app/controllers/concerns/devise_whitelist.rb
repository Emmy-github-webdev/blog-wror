module DeviseWhitelist
  extend ActiveSupport::Concern 

  included do
    protect_from_forgery with: :exception 
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

end