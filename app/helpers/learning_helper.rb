module LearningHelper
  def latest_added_books(n)
    Book.all.first(n)
  end
end
