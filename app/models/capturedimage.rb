class Capturedimage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :prototype

  enum role: [:mainimage, :subimage]

  validates :image, presence: true
  validates :role, presence: true
end
