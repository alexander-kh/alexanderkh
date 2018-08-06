class Course < ApplicationRecord
  default_scope { order(created_at: :desc) }
  
  validates :title, :link, :platform, presence: true
  validates :title, uniqueness: true
  
  has_many :notes, as: :resource, dependent: :destroy
end
