module Mutations
  class DeleteItem < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      item = Item.find(id)
      if item.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: item.errors.full_messages
        }
      end
    end
  end
end
