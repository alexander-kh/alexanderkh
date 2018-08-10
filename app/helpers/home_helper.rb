module HomeHelper  
  def books
    Book.all
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
