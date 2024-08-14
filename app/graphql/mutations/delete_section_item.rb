module Mutations
  class DeleteSectionItem < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      section_item = SectionItem.find(id)

      if section_item.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: section_item.errors.full_messages
        }
      end
    end
  end
end
