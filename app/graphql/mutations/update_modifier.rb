module Mutations
  class UpdateModifier < BaseMutation
    # Define return fields
    field :modifier, Types::ModifierType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :display_order, Integer, required: false
    argument :default_quantity, Integer, required: false
    argument :price_override, Float, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      modifier = Modifier.find(id)
      if modifier.update(attributes)
        {
          modifier: modifier,
          errors: []
        }
      else
        {
          modifier: nil,
          errors: modifier.errors.full_messages
        }
      end
    end
  end
end
