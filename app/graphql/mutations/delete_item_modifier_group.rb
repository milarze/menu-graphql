module Mutations
  class DeleteItemModifierGroup < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      item_modifier_group = ItemModifierGroup.find(id)

      if item_modifier_group.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: item_modifier_group.errors.full_messages
        }
      end
    end
  end
end
