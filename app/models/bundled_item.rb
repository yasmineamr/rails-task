class BundledItem < ApplicationRecord
	has_many :set_items, dependent: :destroy
	has_many :line_items, dependent: :destroy

  	validates :title, :discounted_price, presence: true
  	validates :discounted_price, numericality: {greater_than_or_equal_to: 0.01}
  	validates_presence_of :set_items

	accepts_nested_attributes_for :set_items, :allow_destroy => true, :reject_if => :no_quantity

	def no_quantity(attributes)
		attributes[:quantity].blank? || attributes[:quantity].to_i <= 0
	end
end
