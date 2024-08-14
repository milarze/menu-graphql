require "test_helper"

class ModifierTest < ActiveSupport::TestCase
  test "modifier belongs to modifier group" do
    refute_nil modifiers(:one).modifier_group
  end

  test "modifier belongs to product" do
    refute_nil modifiers(:one).product
  end

  test "modifier belongs to component" do
    refute_nil modifiers(:two).component
  end
end
