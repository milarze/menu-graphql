module Mutations
  class DeleteModifierGroup < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      modifier_group = ModifierGroup.find(id)

      if modifier_group.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: modifier_group.errors.full_messages
        }
      end
    end
  end
end
