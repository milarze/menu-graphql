require "test_helper"

class SectionTest < ActiveSupport::TestCase
  test "section has many menu sections" do
    assert sections(:one).menu_sections.count > 0
  end

  test "section has many menu through menu sections" do
    assert sections(:one).menus.count > 0
  end

  test "identifier is unique" do
    sections(:one)
    other = Section.build(identifier: "id_one", label: "some", description: "desc")

    assert_not other.valid?
  end
end
