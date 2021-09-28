defmodule TplateWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.

  This can be used in your application as:

      use TplateWeb, :controller
      use TplateWeb, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below. Instead, define any helper function in modules
  and import those modules here.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: TplateWeb

      import Plug.Conn
      import TplateWeb.Helper
      import TplateWeb.Gettext
      alias TplateWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      use Phoenix.View,
        root: "lib/tplate_web/templates",
        namespace: TplateWeb

      # Import convenience functions from controllers
      import Phoenix.Controller,
        only: [get_flash: 1, get_flash: 2, view_module: 1, view_template: 1]

      # Include shared imports and aliases for views
      unquote(view_helpers())
    end
  end

  def router do
    quote do
      use Phoenix.Router

      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import TplateWeb.Gettext
    end
  end

  defp view_helpers do
    quote do
      # Import basic rendering functionality (render, render_layout, etc)
      import Phoenix.View

      import TplateWeb.ErrorHelpers
      import TplateWeb.Gettext
      alias TplateWeb.Router.Helpers, as: Routes
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end

defmodule TplateWeb.Helper do
  def respond(conn), do: Plug.Conn.send_resp(conn)

  def respond(conn, code, data) when is_binary(data) do
    Plug.Conn.send_resp(conn, code, data)
  end

  def respond(conn, code, data) do
    payload = Jason.encode!(data)
    Plug.Conn.send_resp(conn, code, payload)
  end
end
