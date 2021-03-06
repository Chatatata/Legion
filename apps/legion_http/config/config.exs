# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :legion_http,
  namespace: Legion.HTTP,
  ecto_repos: [Legion.Repo]

# Configures the endpoint
config :legion_http, Legion.HTTP.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DHRSTmvLpbXKRzl9AukxTAAdlwziFv6hMm5o3C13Vu8j1+cEmUdO8U9va+PvBlw9",
  render_errors: [view: Legion.HTTP.ErrorView, accepts: ~w(json)],
  pubsub_server: Legion.HTTP.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :legion_http, :generators, context_app: :legion

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
