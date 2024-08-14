module Mutations
  class UpdateItemModifierGroup < BaseMutation
    # Define return fields
    field :item_modifier_group, Types::ItemModifierGroupType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :item_id, ID, required: false
    argument :modifier_group_id, ID, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      item_modifier_group = ItemModifierGroup.find(id)

      if item_modifier_group.update(attributes)
        {
          item_modifier_group: item_modifier_group,
          errors: []
        }
      else
        {
          item_modifier_group: nil,
          errors: item_modifier_group.errors.full_messages
        }
      end
    end
  end
end
