require "test_helper"

class ItemTest < ActiveSupport::TestCase
  test "one is a Product" do
    assert items(:one).type == "Product"
  end

  test "two is a Component" do
    assert items(:two).type == "Component"
  end

  test "identifier is unique" do
    items(:one)
    other = Item.build(identifier: "id_one", type: "Product", label: "some", description: "desc", price: 1.0)

    assert_not other.valid?
  end
end
