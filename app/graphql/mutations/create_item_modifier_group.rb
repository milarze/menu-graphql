module Mutations
  class CreateItemModifierGroup < BaseMutation
    # Define return fields
    field :item_modifier_group, Types::ItemModifierGroupType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :item_id, ID, required: true
    argument :modifier_group_id, ID, required: true

    # Define the resolve method
    def resolve(item_id:, modifier_group_id:)
      item_modifier_group = ItemModifierGroup.new(
        item_id: item_id,
        modifier_group_id: modifier_group_id
      )

      if item_modifier_group.save
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
