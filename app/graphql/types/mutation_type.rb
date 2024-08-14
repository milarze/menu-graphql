# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_menu, mutation: Mutations::CreateMenu
    field :update_menu, mutation: Mutations::UpdateMenu
    field :delete_menu, mutation: Mutations::DeleteMenu

    field :create_section, mutation: Mutations::CreateSection
    field :update_section, mutation: Mutations::UpdateSection
    field :delete_section, mutation: Mutations::DeleteSection

    field :create_item, mutation: Mutations::CreateItem
    field :update_item, mutation: Mutations::UpdateItem
    field :delete_item, mutation: Mutations::DeleteItem

    field :create_modifier, mutation: Mutations::CreateModifier
    field :update_modifier, mutation: Mutations::UpdateModifier
    field :delete_modifier, mutation: Mutations::DeleteModifier

    field :create_modifier_group, mutation: Mutations::CreateModifierGroup
    field :update_modifier_group, mutation: Mutations::UpdateModifierGroup
    field :delete_modifier_group, mutation: Mutations::DeleteModifierGroup

    field :create_menu_section, mutation: Mutations::CreateMenuSection
    field :update_menu_section, mutation: Mutations::UpdateMenuSection
    field :delete_menu_section, mutation: Mutations::DeleteMenuSection

    field :create_section_item, mutation: Mutations::CreateSectionItem
    field :update_section_item, mutation: Mutations::UpdateSectionItem
    field :delete_section_item, mutation: Mutations::DeleteSectionItem

    field :create_item_modifier_group, mutation: Mutations::CreateItemModifierGroup
    field :update_item_modifier_group, mutation: Mutations::UpdateItemModifierGroup
    field :delete_item_modifier_group, mutation: Mutations::DeleteItemModifierGroup
  end
end
