defmodule TplateModule.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: TplateModule.PubSub},
      TplateModuleWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: TplateModule.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    TplateModuleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
