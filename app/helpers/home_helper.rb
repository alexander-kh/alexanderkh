module HomeHelper  
  def books
    Book.all
  end
  
  def latest_added_books(n)
    books.first(n)
  end
  
  def courses
    Course.all
  end
end
