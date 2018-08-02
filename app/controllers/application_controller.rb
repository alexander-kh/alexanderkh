class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_i18n_locale_from_params
  
  protected
  
  def set_i18n_locale_from_params
    if locale
      if I18n.available_locales.map(&:to_s).include?(locale)
        I18n.locale = locale
      else
        redirect_to root_path
      end
    end
  end
  
  def locale
    params[:locale]
  end
  
  private
  
  def require_signing_in
    unless Admin.find_by(id: session[:admin_id])
      redirect_to sign_in_url
    end
  end
end
