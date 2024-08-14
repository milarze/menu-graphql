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

```
<Upload the ERD image to ChatGPT>
As an expert in Rails, create the Rails migrations for the ERD in this image.

Create them all in one single migration file
```

Once the migration is generated, review it and then run `bin/rails db:migrate`.
