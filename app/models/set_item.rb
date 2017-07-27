class SetItem < ApplicationRecord
  belongs_to :bundled_item
  belongs_to :item
end
