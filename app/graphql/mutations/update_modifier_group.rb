module Mutations
  class UpdateModifierGroup < BaseMutation
    # Define return fields
    field :modifier_group, Types::ModifierGroupType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :selection_required_min, Integer, required: false
    argument :selection_required_max, Integer, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      modifier_group = ModifierGroup.find(id)

      if modifier_group.update(attributes)
        {
          modifier_group: modifier_group,
          errors: []
        }
      else
        {
          modifier_group: nil,
          errors: modifier_group.errors.full_messages
        }
      end
    end
  end
end
