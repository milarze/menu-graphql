require "test_helper"

class ModifierGroupTest < ActiveSupport::TestCase
  test "modifier group has modifiers" do
    refute_nil modifier_groups(:one).modifiers
  end

  test "modifier group has item modifier groups" do
    refute_nil modifier_groups(:one).item_modifier_groups
  end
end
