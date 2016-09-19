class Capturedimage < ActiveRecord::Base
  mount_uploer :image, ImageUploder
  belongs_to :prototype
end
