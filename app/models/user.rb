class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar,AvatarUploader

  validates_confirmation_of :password


  has_many :prototypes
  has_many :likes
  has_many :comments


  validates :name, presence: true
  validates :password, length: {minimum: 8}
end
