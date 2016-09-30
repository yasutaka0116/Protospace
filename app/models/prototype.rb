class Prototype < ActiveRecord::Base
  has_many :capturedimages, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :capturedimages

  acts_as_taggable_on :prototypes
  acts_as_taggable
  acts_as_ordered_taggable_on :prototypes
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
