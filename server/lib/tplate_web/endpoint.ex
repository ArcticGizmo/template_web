defmodule TplateModuleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :teplate_app

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_teplate_app_key",
    signing_salt: "YRWfXbga"
  ]

  socket "/socket", TplateModuleWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :teplate_app,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Corsica,
    origins: [
      ~r{^http://localhost:}
    ],
    allow_methods: :all,
    allow_headers: :all,
    allow_credentials: true,
    log: [rejected: :warn, invalid: :debug, accepted: :debug]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug TplateModuleWeb.Router
end
