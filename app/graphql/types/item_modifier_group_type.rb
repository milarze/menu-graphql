# frozen_string_literal: true

module Types
  class ItemModifierGroupType < Types::BaseObject
    field :id, ID, null: false
    field :item_id, Integer, null: false
    field :modifier_group_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :item, Types::ItemType, null: false
    field :modifier_group, Types::ModifierGroupType, null: false

    def item
      RecordLoader.for(::Item).load(object.item_id)
    end

    def modifier_group
      RecordLoader.for(::ModifierGroup).load(object.modifier_group_id)
    end
  end
end
