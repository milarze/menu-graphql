require "test_helper"

class ModifierGroupTest < ActiveSupport::TestCase
  test "modifier group has modifiers" do
    refute_nil modifier_groups(:one).modifiers
  end

  test "modifier group has item modifier groups" do
    refute_nil modifier_groups(:one).item_modifier_groups
  end

  test "identifier is unique" do
    modifier_groups(:one)
    other = ModifierGroup.build(identifier: "id_one", label: "some", selection_required_min: 1, selection_required_max: 2)

    assert_not other.valid?
  end
end
