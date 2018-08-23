defmodule InvestrWeb.PageController do
  use InvestrWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
