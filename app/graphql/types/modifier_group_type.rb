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

    def modifiers
      AssociationLoader.for(::ModifierGroup, "modifiers").load(object)
    end

    def items
      AssociationLoader.for(::ModifierGroup, "items").load(object)
    end

    def item_modifier_groups
      AssociationLoader.for(::ModifierGroup, "item_modifier_groups").load(object)
    end
  end
end
