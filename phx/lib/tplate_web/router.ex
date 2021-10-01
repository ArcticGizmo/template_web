defmodule TplateModuleWeb.Router do
  use TplateModuleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/public", TplateModuleWeb do
    pipe_through :api

    get "/hello", PageController, :hello
  end

end
