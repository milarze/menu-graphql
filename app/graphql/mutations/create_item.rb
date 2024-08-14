module Mutations
  class CreateItem < BaseMutation
    # Define return fields
    field :item, Types::ItemType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :type, String, required: true
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false
    argument :price, Float, required: true

    # Define the resolve method
    def resolve(type:, identifier:, label:, price:, description: nil)
      item = Item.new(type: type, identifier: identifier, label: label, description: description, price: price)
      if item.save
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
