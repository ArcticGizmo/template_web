import Config

# Configures the endpoint
config :tplate, TplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yyNVEl99Q3nmdBOav2B6fdeFlLl3iGUze6j9thoImkaA9/nNQAUlVn0QfZa/y7hn",
  render_errors: [view: TplateWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Tplate.PubSub,
  live_view: [signing_salt: "DNoJb92A"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
