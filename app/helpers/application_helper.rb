module ApplicationHelper
  def signed_in?
    session[:admin_id].present?
  end
  
  def current_year
    Date.current.year
  end
end
