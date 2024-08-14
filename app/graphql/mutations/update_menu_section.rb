module Mutations
  class UpdateMenuSection < BaseMutation
    # Define return fields
    field :menu_section, Types::MenuSectionType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :menu_id, ID, required: false
    argument :section_id, ID, required: false
    argument :display_order, Integer, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      menu_section = MenuSection.find(id)
      if menu_section.update(attributes)
        {
          menu_section: menu_section,
          errors: []
        }
      else
        {
          menu_section: nil,
          errors: menu_section.errors.full_messages
        }
      end
    end
  end
end
