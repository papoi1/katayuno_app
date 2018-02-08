class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    redirect_to root_path unless admin_signed_in?
  end

private
  def admin_signed_in?
    user_signed_in? && current_user.admin?
  end
end
