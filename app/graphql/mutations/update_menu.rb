module Mutations
  class UpdateMenu < BaseMutation
    # Define return fields
    field :menu, Types::MenuType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :state, String, required: false
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      menu = Menu.find(id)
      if menu.update(attributes)
        {
          menu: menu,
          errors: []
        }
      else
        {
          menu: nil,
          errors: menu.errors.full_messages
        }
      end
    end
  end
end
