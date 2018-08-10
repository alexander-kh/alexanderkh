class Book < ApplicationRecord
  default_scope { order(created_at: :desc) }
  
  validates :title, :author, :link, :year, :publisher, :status, presence: true
  validates :title, uniqueness: { message: "already presented" }
  
  enum status: {in_process: 0, completed: 1}
  
  has_many :notes, as: :resource, dependent: :destroy
end
