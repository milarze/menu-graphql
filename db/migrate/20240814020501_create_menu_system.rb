# db/migrate/20240814120000_create_menu_system.rb
class CreateMenuSystem < ActiveRecord::Migration[7.0]
  def change
    # Create the menus table
    create_table :menus do |t|
      t.string :identifier, null: false, unique: true
      t.string :label, null: false
      t.string :state
      t.date :start_date
      t.date :end_date

      t.timestamps
    end

    # Create the sections table
    create_table :sections do |t|
      t.string :identifier, null: false, unique: true
      t.string :label, null: false
      t.string :description

      t.timestamps
    end

    # Create the items table
    create_table :items do |t|
      t.string :type, null: false # STI: Product/Component
      t.string :identifier, null: false, unique: true
      t.string :label, null: false
      t.string :description
      t.float :price, null: false

      t.timestamps
    end

    # Create the menu_sections join table
    create_table :menu_sections do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.integer :display_order, default: 0

      t.timestamps
    end

    # Create the section_items join table
    create_table :section_items do |t|
      t.references :section, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :display_order, default: 0

      t.timestamps
    end

    # Create the modifier_groups table
    create_table :modifier_groups do |t|
      t.string :identifier, null: false, unique: true
      t.string :label, null: false
      t.integer :selection_required_min
      t.integer :selection_required_max

      t.timestamps
    end

    # Create the modifiers join table
    create_table :modifiers do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true
      t.integer :display_order, default: 0
      t.integer :default_quantity, default: 0
      t.float :price_override

      t.timestamps
    end

    # Create the item_modifier_groups join table
    create_table :item_modifier_groups do |t|
      t.references :item, null: false, foreign_key: true
      t.references :modifier_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
