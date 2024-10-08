# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :type, String, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String
    field :price, Float, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :section_items, [Types::SectionItemType], null: true
    field :sections, [Types::SectionType], null: true
    field :modifiers, [Types::ModifierType], null: true
    field :modifier_groups, [Types::ModifierGroupType], null: true
    field :item_modifier_groups, [Types::ItemModifierGroupType], null: true

    def section_items
      AssociationLoader.for(::Item, "section_items").load(object)
    end

    def sections
      AssociationLoader.for(::Item, "sections").load(object)
    end

    def modifiers
      AssociationLoader.for(::Item, "modifiers").load(object)
    end

    def modifier_groups
      AssociationLoader.for(::Item, "modifier_groups").load(object)
    end

    def item_modifier_groups
      AssociationLoader.for(::Item, "item_modifier_groups").load(object)
    end
  end
end
