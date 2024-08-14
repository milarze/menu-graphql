module Mutations
  class DeleteSection < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      section = Section.find(id)
      if section.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: section.errors.full_messages
        }
      end
    end
  end
end
