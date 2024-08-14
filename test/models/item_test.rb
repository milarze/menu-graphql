require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "one is a Product" do
    assert items(:one).type == "Product"
  end

  test "two is a Component" do
    assert items(:two).type == "Component"
  end
end
