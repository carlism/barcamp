defmodule BarcampWeb.LayoutView do
  use BarcampWeb, :view
  
  def current_user(conn) do
    conn.assigns[:current_user]
  end
  
end
