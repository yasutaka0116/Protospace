class Prototype < ActiveRecord::Base
  has_many :capturedimages, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :capturedimages

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
