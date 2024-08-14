# frozen_string_literal: true

module Types
  class ModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :selection_required_min, Integer
    field :selection_required_max, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :modifiers, [Types::ModifierType], null: true
    field :items, [Types::ItemType], null: true
    field :item_modifier_groups, [Types::ItemModifierGroupType], null: true
  end
end
