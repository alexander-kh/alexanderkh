class Book < ApplicationRecord
  default_scope { order(created_at: :desc) }
  
  validates :title, :author, :link, :year, :publisher, presence: true
  validates :title, uniqueness: { message: "already presented" }
  
  enum status: {in_process: 0, completed: 1}
end
