# frozen_string_literal: true

module Types
  class MenuType < Types::BaseObject
    field :id, ID, null: false
    field :identifier, String, null: false
    field :label, String, null: false
    field :state, String
    field :start_date, GraphQL::Types::ISO8601Date
    field :end_date, GraphQL::Types::ISO8601Date
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    # Associations
    field :menu_sections, [Types::MenuSectionType], null: true
    field :sections, [Types::SectionType], null: true

    def menu_sections
      AssociationLoader.for(::Menu, "menu_sections").load(object)
    end

    def sections
      AssociationLoader.for(::Menu, "sections").load(object)
    end
  end
end
