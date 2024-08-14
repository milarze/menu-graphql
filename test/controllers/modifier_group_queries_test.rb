require "test_helper"

class ModifierGroupQueriesTest < ActionDispatch::IntegrationTest
  test "get menus" do
    query = <<-GQL
      {
        modifierGroups {
          identifier
        }
      }
    GQL

    post graphql_url, params: {query: query}, as: :json
    assert_response :success
    assert_equal(
      {
        data: {
          modifierGroups: [
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
        createModifierGroup(input: {
          identifier: "id_three",
          label: "Hello",
          selectionRequiredMin: 1,
          selectionRequiredMax: 2
        }) {
          modifierGroup {
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
          createModifierGroup: {
            modifierGroup: {
              identifier: "id_three"
            }
          }
        }
      }.to_json,
      @response.body
    )
  end
end
