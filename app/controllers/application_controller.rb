class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
  
  def require_signing_in
    unless session[:admin_id]
      redirect_to sign_in_path
    end
  end
end
