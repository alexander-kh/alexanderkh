module ApplicationHelper
  
  def signed_in?
    session[:admin_id].present?
  end
  
  def current_year
    Date.current.year
  end
  
  def courses
    Course.all
  end
  
  def books_in_process
    Book.where(status: "in_process")
  end
  
  def books_completed
    Book.where(status: "completed")
  end  
end