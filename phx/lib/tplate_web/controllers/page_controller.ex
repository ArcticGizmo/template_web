defmodule TplateModuleWeb.PageController do
  use TplateModuleWeb, :controller

  def hello(conn, _params) do
    respond(conn, 200, %{essage: "Hello, this is an example api response"})
  end
end
