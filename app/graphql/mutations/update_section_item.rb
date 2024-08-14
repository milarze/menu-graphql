module Mutations
  class UpdateSectionItem < BaseMutation
    # Define return fields
    field :section_item, Types::SectionItemType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :section_id, ID, required: false
    argument :item_id, ID, required: false
    argument :display_order, Integer, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      section_item = SectionItem.find(id)

      if section_item.update(attributes)
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
