#!/usr/bin/env ruby

require "net/http"
require "json"
require "parallel"

# Define the GraphQL endpoint
url = URI("https://menu-graphql.fly.dev/graphql")

# Example GraphQL query
queries = [
  {
    query: <<-GRAPHQL
      {
         menus {
            id
            identifier
            label
            state
            startDate
            endDate
            sections {
               id
               identifier
               label
               items {
                  id
                  identifier
                  label
                  price
                  type
                  itemModifierGroups {
                     id
                     modifierGroup {
                        id
                        identifier
                        modifiers {
                           id
                           item {
                              id
                           }
                        }
                     }
                  }
               }
            }
         }
      }
    GRAPHQL
  }.to_json,
  {
    query: <<-GRAPHQL
      {
         items {
            id
            identifier
            label
            price
            type
         }
      }
    GRAPHQL
  }.to_json,
  {
    query: <<-GRAPHQL
      {
         menu(id: "1") {
            id
            identifier
            sections {
               id
               identifier
               label
               items {
                  price
               }
            }
         }
      }
    GRAPHQL
  }.to_json
]

# Function to make the API request
def make_request(url, query)
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  request = Net::HTTP::Post.new(url)
  request["Content-Type"] = "application/json"
  request.body = query

  response = http.request(request)
  # Results are not relevant, so we don't process the response
rescue => e
  puts "Request failed: #{e.message}"
end

# Function to perform load testing
def load_test(requests_count, processes_count, url, queries)
  Parallel.each(1..processes_count, in_processes: processes_count) do
    requests_count.times { make_request(url, queries[rand(1..2)]) }
  end
end

# Parameters for the load test
requests_per_process = 100  # Number of requests per process
processes = 50  # Number of processes to run concurrently

# Start the load test
start_time = Time.now
load_test(requests_per_process, processes, url, queries)
duration = Time.now - start_time

puts "Completed #{requests_per_process * processes} requests in #{duration.round(2)} seconds."
