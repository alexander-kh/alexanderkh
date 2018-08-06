class Note < ApplicationRecord
  
  belongs_to :resource, polymorphic: true
  
  validates :text, presence: true
end
