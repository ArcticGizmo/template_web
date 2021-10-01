import Config

# Configures the endpoint
config :teplate_app, TplateModuleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "yyNVEl99Q3nmdBOav2B6fdeFlLl3iGUze6j9thoImkaA9/nNQAUlVn0QfZa/y7hn",
  render_errors: [view: TplateModuleWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: TplateModule.PubSub,
  live_view: [signing_salt: "DNoJb92A"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
