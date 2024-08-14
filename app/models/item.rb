class Item < ApplicationRecord
  has_many :section_items, dependent: :destroy
  has_many :sections, through: :section_items

  has_many :modifiers, dependent: :destroy
  has_many :modifier_groups, through: :modifiers

  has_many :item_modifier_groups, dependent: :destroy
  has_many :modifier_groups, through: :item_modifier_groups

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
end
