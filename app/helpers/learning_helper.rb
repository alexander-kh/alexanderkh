module LearningHelper
  def latest_added_books(n)
    Book.all.first(n)
  end
  
  def courses
    Course.all
  end
end
