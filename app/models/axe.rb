class Axe < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  validate :valid_url?
  validates :user, presence: true
  validates :caption, length: {maximum: 100}

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

  def self.all_with_count(user)
    axe_data = Axe.select("axes.id, users.id as user_id, url, username, caption")
                  .joins('inner join users on users.id = user_id')
    axes_info = axe_data.to_a.map(&:serializable_hash)
    axes_info = axes_info.map(&:symbolize_keys)
    axes_info.each do |a|
      a[:like_count] = like_count(a[:id])
      if user
        a[:liked_by_user] = liked_by_user(a[:id], user.id)
      else
        a[:liked_by_user] = false
      end
    end
    return axes_info
  end

  def self.rig(user_id)
    user = User.find_by(id: user_id)
    if user
      axe_data = Axe.select('axes.id, users.id as user_id, url, username, caption')
                    .where('axes.user_id = ?', user.id)
                    .joins('inner join users on users.id = user_id')
      axes_info = axe_data.to_a.map(&:serializable_hash)
      axes_info = axes_info.map(&:symbolize_keys)
      axes_info.each do |a|
        a[:like_count] = like_count(a[:id])
        a[:liked_by_user] = liked_by_user(a[:id],user_id)
      end
      return axes_info
    else
      return nil
    end
  end

  def self.like_count(axe_id)
    axe = Axe.find_by(id: axe_id)
    if axe
      return axe.likes.count
    else
      return 0
    end    
  end

  def self.liked_by_user(axe_id, user_id=nil)
    axe = Axe.find_by(id: axe_id)
    return false if !user_id || !axe
    user = User.find_by(id: user_id)
    if user
      likes = axe.likes.where('user_id = ?', user_id).count
      return likes > 0 ? true : false
    else
      return false
    end
  end
end