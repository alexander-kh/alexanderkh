module SessionsHelper
  def signed_in?
    session[:admin_id].present?
  end
end