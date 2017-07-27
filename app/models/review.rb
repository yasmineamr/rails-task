class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :text,:rate, presence: true

end
