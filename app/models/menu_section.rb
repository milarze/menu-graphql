class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  validates :display_order, numericality: {only_integer: true}
end
