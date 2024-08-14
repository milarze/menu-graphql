require "test_helper"

class MenuTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has many menu sections" do
    menu = menus(:one)
    assert menu.menu_sections.count > 0
  end
end
