module WritingsHelper
  
  def newest_writing
    signed_in? ? Writing.last : Writing.where(status: "open").last
  end
  
  def next_writings
    if signed_in?
      Writing.order(created_at: :desc).offset(1)
    else
      Writing.where(status: "open").order(created_at: :desc).offset(1)
    end
  end
end
