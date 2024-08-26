# frozen_string_literal: true

module Types
  class SectionType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :menu_sections, [Types::MenuSectionType], null: true
    field :menus, [Types::MenuType], null: true
    field :section_items, [Types::SectionItemType], null: true
    field :items, [Types::ItemType], null: true

    def menu_sections
      AssociationLoader.for(::Section, "menu_sections").load(object)
    end

    def menus
      AssociationLoader.for(::Section, "menus").load(object)
    end

    def section_items
      AssociationLoader.for(::Section, "section_items").load(object)
    end

    def items
      AssociationLoader.for(::Section, "items").load(object)
    end
  end
end
