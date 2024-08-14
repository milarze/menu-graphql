module Mutations
  class UpdateItem < BaseMutation
    # Define return fields
    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :type, String, required: false
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :description, String, required: false
    argument :price, Float, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      item = Item.find(id)
      if item.update(attributes)
        {
          item: item,
          errors: []
        }
      else
        {
          item: nil,
          errors: item.errors.full_messages
        }
      end
    end
  end
end
