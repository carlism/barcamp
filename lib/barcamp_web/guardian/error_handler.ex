defmodule BarcampWeb.Guardian.ErrorHandler do
  @moduledoc """
  Logic for handling errors during the auth process
  """

  import Plug.Conn

  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(401, to_string(type))
  end
end