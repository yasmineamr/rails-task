class Item < ApplicationRecord
  searchkick word_start: [:title]

  enum item_type: [:film, :music, :game, :entertainment_news]
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :line_items
  has_many :set_items

  validates :title, :description, :item_type, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}

  before_destroy :ensure_not_referenced_by_any_line_item
  before_destroy :ensure_not_referenced_by_any_set_item

  private
	def ensure_not_referenced_by_any_line_item 
		unless line_items.empty?
			errors.add(:base, 'Line Items present')
			throw :abort 
		end
	end

  def ensure_not_referenced_by_any_set_item 
    unless set_items.empty?
      errors.add(:base, 'Set Items present')
      throw :abort 
    end
  end
end
