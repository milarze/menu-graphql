require "test_helper"

class MenuTest < ActiveSupport::TestCase
  test "has many menu sections" do
    menu = menus(:one)
    assert menu.menu_sections.count > 0
  end

  test "identifier is unique" do
    menus(:one)
    other = Menu.build(identifier: "id_one", label: "some", state: "desc", start_date: "2024-08-13", end_date: "2024-09-15")

    assert_not other.valid?
  end
end
