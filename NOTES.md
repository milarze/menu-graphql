# Notes

## Time blocks

Started: 14/08/2024 09:45
Paused: 14/08/2024 10:20
Duration: 35 mins

Started: 14/08/2024 11:00
Paused: 14/08/2024 11:30
Duration: 30 mins

Started: 14/08/2024 11:40
Paused: 14/08/2024 12:00
Duration: 20 mins

Started: 14/08/2024 14:30
Paused: 14/08/2024 15:40
Duration: 1 hr 10 mins

Started: 14/08/2024 23:40
Ended: 15/08/2024 04:00
Duration: 4 hr 20 mins

Total Duration: 6 hr 55 mins

## Create Rails App

```shell
rails new menu-graphql --database=postgresql --api
```

## Add GraphQL gem

```shell
bundle add graphiql-rails
```

A quick query on ChatGPT shows this is the go-to for Rails.
It also has a GraphQL IDE built-in which makes it very friendly to use in testing.

## Set up database

Add the `dotenv` gem.

```shell
bundle add dotenv
```

Create a new PostgreSQL user with superuser permissions for local setup.

```sql
REATE ROLE menu_graphql WITH SUPERUSER LOGIN PASSWORD '<some password>';
```

Create the databases.

```shell
bin/rails db:setup
```

## Generate the Rails Migrations

Prompt:

```text
<Upload the ERD image to ChatGPT>
As an expert in Rails, create the Rails migrations for the ERD in this image.

Create them all in one single migration file
```

Once the migration is generated, review it and then run `bin/rails db:migrate`.

## Set up models

Prompt:

```text
Now create the models for the ERD. Use the bin/rails command to do it.
```

The generated commands will create DB migration files which
are deleted as the database was already setup.
In hindsight, the model generation command should have been
used instead of just the migration generation.
In any case, the models are created.

We will need to fill in the associations accordingly.
ChatGPT generates the contents of each file as well,
so copy those into the files themselves.

## Add Graphiql stuff

1. GraphiQL requires sprockets or propshaft,
   I chose Sprockets as I am somewhat familiar with it.
2. Create the manifest and add the graphiql css and js to it.
3. Mount the engine at `/graphiql`

## Add GraphQL

Initially thought that GraphiQL included the GraphQL engine,
but it doesn't.
So `graphql` gem will be used for the actual GraphQL engine.

Install it using:

```shell
bundle add grphql
bin/rails generate graphql:install
```

## Generate all the types

Prompt in the same ChatGPT conversation.

```text

using GraphQL gem create the rails generation for all the objects:
```

This will generate all the types. Just add associations to those types.

## Generate all the mutations

Prompt

```text
Create the mutations in separate files for all the models.
```

This generates all the mutation code and makes it available in the schema.

## Update all the models

Adding model tests to ensure that the associations are properly modelled.

## Testing GraphQL

We need to export the schema, send it to ChatGPT and ask it to generate dummy data.

Install `graphql-cli`

```shell
npm install -g apollo graphql
apollo schema:download --endpoint=http://localhost:9000/graphql schema.json
```

The schema file is put into schema.json and we can use that to generate
data using ChatGPT.

## Ensuring relationships work

By default Rails creates the `id` column.
In this case, all the `id` columns were created and are being used as the keys
and foreign keys.

When creating items, we need to create the first object, get the `id` and pass
it using the references.

All the mutations for relationship tables take in id values, so we will need
to retrieve the `id` during creation and pass it along for usage.

## STI and belongs_to

I originally added `belongs_to :product, foreign_key: "item_id"` in the
`Modifier` model, but that was causing issues with creating a Modifier
linked to a Component instead of a Product, and vice versa.

## Deploy

It is deployed on Digitalocean droplets as I have an account there and
exisitng droplets.

Setting up in manually is a tedious process. However, that is balanced
out by not having to pay extra for hosting.

## Final thoughts

Attempting to draw understanding of business problems purely through an
ERD will not be perfect. In my case, the ERD had context about the
ordering and restaurant menu systems that I did not have.
For example, what are the differences between a `Product` and a `Component`?

ChatGPT or some other LLM is amazing at writing boilerplate code for web or
API applications as well as for generating dummy data. However, I ran out
of credits to upload stuff to ChatGPT and hence could not generate the
dummy data in production using it.
A major downside of this is that there is no simple way to easily
or quickly verify that the generated code is correct.
Either eyeball it, or write tests.
Rule of thumb would be write the code, or write the tests, don't
LLM both parts.

There is a reason why Heroku exists or other similar platforms.
Even being very familiar with setting up bare metal servers,
it still took me a long time to setup the server and deploy
there are always issues with installing ruby or the database or
some such. In hindsight, I should have used Docker.

The test coverage for this repo is less than ideal.
I was focused on getting it up and running and having some confidence that
it would run okay. I was not looking to have >80% test coverage or other
some such. Chasing such a metric in such a short span of time is an
exercise in futility.

Overall, it was fun to fully set up end-to-end a Rails service.
