module Mutations
  class UpdateSection < BaseMutation
    # Define return fields
    field :section, Types::SectionType, null: true
    field :errors, [String], null: false

    # Define arguments
    argument :id, ID, required: true
    argument :identifier, String, required: false
    argument :label, String, required: false
    argument :description, String, required: false

    # Define the resolve method
    def resolve(id:, **attributes)
      section = Section.find(id)
      if section.update(attributes)
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
