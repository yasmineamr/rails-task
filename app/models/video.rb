class Video < ApplicationRecord
  belongs_to :item

  validates :url, presence: true

end
