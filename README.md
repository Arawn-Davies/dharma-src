# dharma-src

A Rails app collecting Soto Zen and Serene Reflection Meditation resources, with
local discussion pages for each item.

## Docker Compose

Run the app locally with Docker Compose:

```sh
cp .env.example .env
docker compose build
docker compose run --rm setup
docker compose up -d app
docker attach app
```

Then open:

```text
http://localhost:3000
```

The Compose service:

- builds the production Rails image
- provides a one-shot `setup` service for `db:prepare` and `db:seed`
- stores SQLite databases in the `dharma_src_storage` Docker volume
- serves the app on host port `3000`

On systems with the legacy Compose binary, use `docker-compose` in place of
`docker compose`.

For a public deployment, replace `SECRET_KEY_BASE` in `.env` with:

```sh
openssl rand -hex 64
```

## Tests

The current app was developed and tested through Docker:

```sh
docker run --rm -v "$PWD:/app" -w /app ruby:3.3 \
  bash -lc "bundle install && bundle exec rails test"
```
