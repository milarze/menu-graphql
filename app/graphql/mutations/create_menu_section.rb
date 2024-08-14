module Mutations
  class CreateMenuSection < BaseMutation
    # Define return fields
    field :menu_section, Types::MenuSectionType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :menu_id, ID, required: true
    argument :section_id, ID, required: true
    argument :display_order, Integer, required: false, default_value: 0

    # Define the resolve method
    def resolve(menu_id:, section_id:, **attributes)
      menu_section = MenuSection.new(menu_id: menu_id, section_id: section_id, **attributes)
      if menu_section.save
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
