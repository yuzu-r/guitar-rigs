class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :omniauthable
  has_many :axes
  has_many :likes
  validates :username, :presence => true, uniqueness: true, :format => {:with => /\A[^@]/, :message => ": @ reserved for Twitter authentication."}
end
