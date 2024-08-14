require "test_helper"

class ModifierQueriesTest < ActionDispatch::IntegrationTest
  test "get menus" do
    query = <<-GQL
      {
        modifiers {
          displayOrder
        }
      }
    GQL

    post graphql_url, params: {query: query}, as: :json
    assert_response :success
    assert_equal(
      {
        data: {
          modifiers: [
            {
              displayOrder: 1
            },
            {
              displayOrder: 1
            }
          ]
        }
      }.to_json,
      @response.body
    )
  end

  test "create menu" do
    item_id = Item.first.id
    modifier_group_id = ModifierGroup.first.id
    mutation = <<-GQL
      mutation {
        createModifier(input: {
          itemId: "#{item_id}",
          modifierGroupId: "#{modifier_group_id}",
          displayOrder: 1,
          defaultQuantity: 10,
          priceOverride: 100
        }) {
          modifier {
            id
          }
        }
      }
    GQL

    post graphql_url, params: {query: mutation}, as: :json
    assert_response :success
    response_hash = JSON.parse(@response.body)
    refute_nil response_hash.dig(
      "data",
      "createModifier",
      "modifier",
      "id"
    )
  end
end
