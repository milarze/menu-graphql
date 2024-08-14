# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Fetch all menus
    field :menus, [Types::MenuType], null: false

    # Fetch a specific menu by ID
    field :menu, Types::MenuType, null: false do
      argument :id, ID, required: true
    end

    # Fetch all sections
    field :sections, [Types::SectionType], null: false

    # Fetch a specific section by ID
    field :section, Types::SectionType, null: false do
      argument :id, ID, required: true
    end

    # Fetch all items
    field :items, [Types::ItemType], null: false

    # Fetch a specific item by ID
    field :item, Types::ItemType, null: false do
      argument :id, ID, required: true
    end

    # Fetch all modifiers
    field :modifiers, [Types::ModifierType], null: false

    # Fetch a specific modifier by ID
    field :modifier, Types::ModifierType, null: false do
      argument :id, ID, required: true
    end

    # Fetch all modifiers
    field :modifier_groups, [Types::ModifierGroupType], null: false

    # Fetch a specific modifier by ID
    field :modifier_group, Types::ModifierGroupType, null: false do
      argument :id, ID, required: true
    end

    def menus
      Menu.all
    end

    def menu(id:)
      Menu.find(id)
    end

    def sections
      Section.all
    end

    def section(id:)
      Section.find(id)
    end

    def items
      Item.all
    end

    def item(id:)
      Item.find(id)
    end

    def modifiers
      Modifier.all
    end

    def modifier(id:)
      Modifier.find(id)
    end

    def modifier_groups
      ModifierGroup.all
    end

    def modifier_group(id:)
      ModifierGroup.find(id)
    end
  end
end
