module Mutations
  class CreateModifierGroup < BaseMutation
    # Define return fields
    field :modifier_group, Types::ModifierGroupType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :selection_required_min, Integer, required: false, default_value: 0
    argument :selection_required_max, Integer, required: false, default_value: 0

    # Define the resolve method
    def resolve(identifier:, label:, selection_required_min: 0, selection_required_max: 0)
      modifier_group = ModifierGroup.new(
        identifier: identifier,
        label: label,
        selection_required_min: selection_required_min,
        selection_required_max: selection_required_max
      )

      if modifier_group.save
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
