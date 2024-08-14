class ItemModifierGroup < ApplicationRecord
  belongs_to :item
  belongs_to :product, foreign_key: "item_id"
  belongs_to :component, foreign_key: "item_id"
  belongs_to :modifier_group
end
