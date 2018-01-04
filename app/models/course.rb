class Course < ApplicationRecord
  validates :title, :link, :platform, presence: true
  validates :title, uniqueness: true
end
