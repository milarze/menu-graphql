module Mutations
  class CreateModifier < BaseMutation
    # Define return fields
    field :modifier, Types::ModifierType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true
    argument :display_order, Integer, required: false, default_value: 0
    argument :default_quantity, Integer, required: false, default_value: 0
    argument :price_override, Float, required: false

    # Define the resolve method
    def resolve(item_id:, modifier_group_id:, **attributes)
      modifier = Modifier.new(item_id: item_id, modifier_group_id: modifier_group_id, **attributes)
      if modifier.save
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
