module Mutations
  class DeleteMenuSection < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      menu_section = MenuSection.find(id)
      if menu_section.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: menu_section.errors.full_messages
        }
      end
    end
  end
end
