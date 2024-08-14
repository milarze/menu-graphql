module Mutations
  class DeleteModifier < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      modifier = Modifier.find(id)
      if modifier.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: modifier.errors.full_messages
        }
      end
    end
  end
end
