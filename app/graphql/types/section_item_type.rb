# frozen_string_literal: true

module Types
  class SectionItemType < Types::BaseObject
    field :id, ID, null: false
    field :section_id, Integer, null: false
    field :item_id, Integer, null: false
    field :display_order, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :section, Types::SectionType, null: false
    field :item, Types::ItemType, null: false
  end
end
