class Writing < ApplicationRecord
  before_create :set_permalink
  
  validates :title, :content, :status, presence: true
  validates :title, uniqueness: true
    
  enum status: {personal: 0, open: 1}
  
  def to_param
    permalink
  end
  
  private
  
  def set_permalink
    self.permalink = title.parameterize
  end
end
