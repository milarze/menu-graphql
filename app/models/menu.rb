class Menu < ApplicationRecord
  has_many :menu_sections, dependent: :destroy
  has_many :sections, through: :menu_sections

  validates :identifier, presence: true, uniqueness: true
  validates :label, presence: true
end
