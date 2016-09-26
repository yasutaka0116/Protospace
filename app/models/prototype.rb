class Prototype < ActiveRecord::Base
  has_many :capturedimages, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :capturedimages
end
