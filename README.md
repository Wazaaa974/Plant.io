# plante.io

First Rails foundation for the `plante.io` web app.

## Stack

- Rails 8
- PostgreSQL
- Tailwind CSS
- esbuild
- Rails authentication generator
- Active Storage for plant photos

## Current scope

- account creation and sign in
- dashboard
- plant collection
- plant creation with first photo
- growth stage, level, XP, and basic timeline events

## Product docs

- [Project context](./contexte.md)
- [MVP kanban](./mvp-kanban.md)

## Boot

```bash
bundle install
yarn install
bin/rails db:create db:migrate
bin/dev
```
