class Photo < ApplicationRecord
  belongs_to :item
  validates :file, presence: true

  mount_uploader :file, PictureUploader
end
