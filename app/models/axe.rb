class Axe < ActiveRecord::Base
  belongs_to :user
  validate :valid_url?
  validates :user, presence: true

  def valid_url?
    allowable_image = [:gif, :jpg, :jpeg, :png]
    if url
      clean_url = "".html_safe + url
      fast_image = FastImage::type(clean_url)
      if (!fast_image) 
        errors.add(:url, 'Invalid URL or file type!')
      else
       if allowable_image.none?{|t| t == fast_image} 
        errors.add(:url,'Invalid image type (gif, jpg/jpeg or png only')
       end
      end
    end    
  end

end