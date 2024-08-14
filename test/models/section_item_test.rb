require "test_helper"

class SectionItemTest < ActiveSupport::TestCase
  test "section item belongs to item" do
    section_item = section_items(:one)
    refute_nil section_item.item
  end

  test "section item belongs to section" do
    section_item = section_items(:one)
    refute_nil section_item.section
  end
end
