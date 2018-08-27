use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# BarcampWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :barcamp, BarcampWeb.Endpoint,
  load_from_system_env: true,
  # http: [port: {:system, "PORT"}], # Uncomment this line if you are running Phoenix 1.2
  server: true, # Without this line, your app will not start the web server!
  secret_key_base: "${SECRET_KEY_BASE}",
  url: [host: "puny-scaly-ox.gigalixirapp.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Configure your database
config :barcamp, Barcamp.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: "${DATABASE_URL}",
  database: "",
  ssl: true,
  pool_size: 1 # Free tier db only allows 1 connection

# Do not print debug messages in production
config :logger, level: :info


config :barcamp,
  BarcampWeb.Guardian.Tokenizer,
  issuer: "barcamp",
  secret_key: Map.fetch!(System.get_env(), "GUARDIAN_KEY")