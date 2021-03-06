class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  private

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
