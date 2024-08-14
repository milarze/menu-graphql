require "test_helper"

class SectionQueriesTest < ActionDispatch::IntegrationTest
  test "get sections" do
    query = <<-GQL
      {
        sections {
          identifier
        }
      }
    GQL

    post graphql_url, params: {query: query}, as: :json
    assert_response :success
    assert_equal(
      {
        data: {
          sections: [
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

  test "create section" do
    mutation = <<-GQL
      mutation {
        createSection(input: {
          identifier: "id_three",
          label: "Hello",
          description: "desc"
        }) {
          section {
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
          createSection: {
            section: {
              identifier: "id_three"
            }
          }
        }
      }.to_json,
      @response.body
    )
  end
end
