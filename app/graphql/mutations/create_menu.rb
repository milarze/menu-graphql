module Mutations
  class CreateMenu < BaseMutation
    # Define return fields
    field :menu, Types::MenuType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :state, String, required: false
    argument :start_date, GraphQL::Types::ISO8601Date, required: false
    argument :end_date, GraphQL::Types::ISO8601Date, required: false

    # Define the resolve method
    def resolve(identifier:, label:, state: nil, start_date: nil, end_date: nil)
      menu = Menu.new(identifier: identifier, label: label, state: state, start_date: start_date, end_date: end_date)
      if menu.save
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
