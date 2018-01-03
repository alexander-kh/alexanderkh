class Book < ApplicationRecord
  default_scope { order(created_at: :desc) }
  
  validates :title, :author, :link, :year, :publisher, presence: true
  validates :title, uniqueness: { message: "already presented" }
end
