defmodule TplateWeb.Router do
  use TplateWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/public", TplateWeb do
    pipe_through :api

    get "/hello", PageController, :hello
  end

end
