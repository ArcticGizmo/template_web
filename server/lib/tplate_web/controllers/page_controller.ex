defmodule TplateWeb.PageController do
  use TplateWeb, :controller

  def hello(conn, _params) do
    respond(conn, 200, %{essage: "Hello, this is an example api response"})
  end
end
