# lib/graphql_collector.rb
if defined?(PrometheusExporter::Server)
  require "graphql/tracing"

  class GraphQLCollector < GraphQL::Tracing::PrometheusTrace::GraphQLCollector
  end
end
