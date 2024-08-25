# Stability Notes

Started: 26/08/2024 00:50

## Initial Thoughts

The scope of the requirements has increased and there is a need to scale up.
The current bare metal DigitalOcean bucket and resources are not enough to
handle the requirements easily.
As a result we are moving to a cloud provider.
Originally, this would have been Heroku, but since Heroku no longer has a
free tier, we will be using fly.io.

### Deployment to Fly.io

1. Install the fly CLI
2. Run `fly launch` in the root directory.
3. Fly.io handles the deployment. It took about 5 minutes.

## Seeding Data

ChatGPT ran out of analysis tokens.

Seeding data using Rails Console.
Using the Fly.io CLI, we can run `fly console -a menu-grpahql --command="bin/rails c"`

```ruby
ActiveRecord::Base.transaction do
   menu = Menu.create(
      identifier: "menu-002",
      label: "Awesome Menu",
      state: "active",
      start_date: 1.year.ago,
      end_date: Time.now.utc + 1.year
   )

   sections = 6.times.map do |index|
      section = Section.create(
         identifier: "section-#{index}",
         label: "Section Number #{index}",
         description: "This is section number #{index} of the menu called #{menu.label}"
      )
      menu.menu_sections.create(section: section)
      section
   end

   sections.map do |section|
      products = 10.times.map do |product_index|
         product = Item.create(
            type: "Product",
            identifier: "product-#{product_index}-#{section.identifier}",
            label: "Product called #{product_index}-#{section.identifier}",
            description: "This describes a product in #{section.label}.",
            price: rand(0..500.0).round(2)
         )
         section.section_items.create(item: product, display_order: product_index)

         next if product_index >= 5

         modifier_groups = 2.times do |mod_group_index|
            modifier_group = ModifierGroup.create(
               identifier: "mod-group-#{mod_group_index}-#{product.identifier}",
               label: "Modifier Group #{mod_group_index}-#{product.identifier}",
               selection_required_min: rand(0..10),
               selection_required_max: rand(11..100)
            )
            product.item_modifier_groups.create(
               modifier_group: modifier_group
            )

            3.times do |comp_index|
               component = Item.create(
                  type: "Component",
                  identifier: "component-#{comp_index}-#{modifier_group.identifier}",
                  label: "Component called #{comp_index}-#{modifier_group.identifier}",
                  description: "This is a component of a modifier group: #{modifier_group.identifier}",
                  price: rand(0..50.0).round(2)
               )
               modifier_group.modifiers.create(item: component,
                  display_order: mod_group_index,
                  default_quantity: rand(5..100),
                  price_override: rand(0.1..10.0).round(2)
               )
            end
         end
      end
   end
end
```

## Logging

Without proper logging we will not be able to figure out what is slow
or how to improve performance.

## Query Performance

