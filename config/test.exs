use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :barcamp, BarcampWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :barcamp, Barcamp.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "barcamp_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :barcamp, BarcampWeb.Guardian.Tokenizer,
  issuer: "barcamp",
  secret_key: "our random string"
    