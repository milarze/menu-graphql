require "test_helper"

class MenuQueriesTest < ActionDispatch::IntegrationTest
  test "get menus" do
    query = <<-GQL
      {
        menus {
          identifier
        }
      }
    GQL

    post graphql_url, params: {query: query}, as: :json
    assert_response :success
    assert_equal(
      {
        data: {
          menus: [
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

  test "create menu" do
    mutation = <<-GQL
      mutation {
        createMenu(input: {
          identifier: "id_three",
          label: "Hello",
          state: "Active",
          startDate: "2024-08-12",
          endDate: "2024-09-30"
        }) {
          menu {
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
          createMenu: {
            menu: {
              identifier: "id_three"
            }
          }
        }
      }.to_json,
      @response.body
    )
  end
end
