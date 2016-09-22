class Capturedimage < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  belongs_to :prototype

  enum role: {mainimage: 0, subimage: 1}
end
