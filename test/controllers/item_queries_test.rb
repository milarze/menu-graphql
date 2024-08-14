require "test_helper"

class ItemQueriesTest < ActionDispatch::IntegrationTest
  test "get items" do
    query = <<-GQL
      {
        items {
          identifier
        }
      }
    GQL

    post graphql_url, params: {query: query}, as: :json
    assert_response :success
    assert_equal(
      {
        data: {
          items: [
            {
              identifier: "id_one"
            },
            {
              identifier: "id_two"
            }
          ]
        }
      }.to_json,
      @response.body
    )
  end

  test "create item" do
    mutation = <<-GQL
      mutation {
        createItem(input: {
          identifier: "id_three",
          type: "Product",
          label: "Label",
          description: "Description",
          price: 10.0
        }) {
          item {
            identifier
          }
        }
      }
    GQL

    post graphql_url, params: {query: mutation}, as: :json
    assert_response :success
    assert_equal(
      {
        data: {
          createItem: {
            item: {
              identifier: "id_three"
            }
          }
        }
      }.to_json,
      @response.body
    )
  end
end
