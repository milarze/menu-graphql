require "test_helper"

class ItemModifierGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "item modifier group belongs to item" do
    refute_nil item_modifier_groups(:one).item
  end

  test "item modifier group belongs to product" do
    refute_nil item_modifier_groups(:one).product
  end

  test "item modifier group belongs to component" do
    refute_nil item_modifier_groups(:two).component
  end
end
