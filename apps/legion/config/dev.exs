use Mix.Config

# Use canary configuration as baseline
import_config "canary.exs"

# Configure the database
config :legion, Legion.Repo,
  username: "postgres",
  password: "postgres",
  database: "legion_dev",
  hostname: "127.0.0.1",
  pool_size: 10

# fiorix/freegeoip container in Docker to IP Reverse Geocoding
config :freegeoip,
  base_url: "https://freegeoip.acme.services.thenopebox.com"
