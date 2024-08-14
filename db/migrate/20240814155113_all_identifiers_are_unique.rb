class AllIdentifiersAreUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :items, :identifier, unique: true
    add_index :menus, :identifier, unique: true
    add_index :modifier_groups, :identifier, unique: true
    add_index :sections, :identifier, unique: true
  end
end
