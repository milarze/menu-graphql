# Notes

Started: 14/08/2024 09:45

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

Pause at: 10:20

Continue at: 11:00
