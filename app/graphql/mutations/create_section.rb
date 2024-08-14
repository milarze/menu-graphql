module Mutations
  class CreateSection < BaseMutation
    # Define return fields
    field :section, Types::SectionType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :identifier, String, required: true
    argument :label, String, required: true
    argument :description, String, required: false

    # Define the resolve method
    def resolve(identifier:, label:, description: nil)
      section = Section.new(identifier: identifier, label: label, description: description)
      if section.save
        {
          section: section,
          errors: []
        }
      else
        {
          section: nil,
          errors: section.errors.full_messages
        }
      end
    end
  end
end
