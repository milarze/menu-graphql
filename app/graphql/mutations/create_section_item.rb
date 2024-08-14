module Mutations
  class CreateSectionItem < BaseMutation
    # Define return fields
    field :section_item, Types::SectionItemType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :section_id, ID, required: true
    argument :item_id, ID, required: true
    argument :display_order, Integer, required: false, default_value: 0

    # Define the resolve method
    def resolve(section_id:, item_id:, display_order: 0)
      section_item = SectionItem.new(
        section_id: section_id,
        item_id: item_id,
        display_order: display_order
      )

      if section_item.save
        {
          section_item: section_item,
          errors: []
        }
      else
        {
          section_item: nil,
          errors: section_item.errors.full_messages
        }
      end
    end
  end
end
