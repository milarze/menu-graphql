require "test_helper"

class MenuSectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "belongs to menu" do
    menu_section = menu_sections(:one)
    refute_nil menu_section.menu
  end

  test "belongs to section" do
    menu_section = menu_sections(:one)
    refute_nil menu_section.section
  end
end
