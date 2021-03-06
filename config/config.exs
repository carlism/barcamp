# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :barcamp,
  ecto_repos: [Barcamp.Repo]

# Configures the endpoint
config :barcamp, BarcampWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ny+JOdPenM9wcq7dFCIltS3wgCgLKcWHjqGpHXZ3KHpZ027TaiNXakB0vj3r7jUW",
  render_errors: [view: BarcampWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Barcamp.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "EvT9tBTbAat/Ryhkd+7yO3Q4RMUm5eN7"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
