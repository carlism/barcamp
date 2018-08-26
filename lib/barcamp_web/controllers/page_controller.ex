defmodule BarcampWeb.PageController do
  use BarcampWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
