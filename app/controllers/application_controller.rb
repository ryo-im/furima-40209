class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :check_env_variables
  before_action :basic_auth

  private


  def check_env_variables
    Rails.logger.info 'BASIC_AUTH_USER: ' + ENV["BASIC_AUTH_USER"].to_s
    Rails.logger.info 'BASIC_AUTH_PASSWORD: ' + ENV["BASIC_AUTH_PASSWORD"].to_s
   end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :last_name, :first_name,
                                             :last_name_katakana, :first_name_katakana, :birth_date])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end