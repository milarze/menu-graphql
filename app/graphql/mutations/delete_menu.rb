module Mutations
  class DeleteMenu < BaseMutation
    # Define return fields
    field :success, Boolean, null: false
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true

    # Define the resolve method
    def resolve(id:)
      menu = Menu.find(id)
      if menu.destroy
        {
          success: true,
          errors: []
        }
      else
        {
          success: false,
          errors: menu.errors.full_messages
        }
      end
    end
  end
end
