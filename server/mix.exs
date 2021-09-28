defmodule Tplate.MixProject do
  use Mix.Project

  def project do
    [
      app: :tplate,
      version: "0.1.0",
      elixir: "~> 1.10",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Tplate.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:phoenix, "~> 1.5.3"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:corsica, "~> 1.1"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, "~> 0.15.0"},
      {:elixir_uuid, "~> 1.2"},

      # this is a fix to work without OTP 22+
      {:cowboy, "< 2.8.0", override: true}
    ]
  end

  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
