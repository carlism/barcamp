defmodule BarcampWeb.Auth.UserController do
  use BarcampWeb, :controller

  alias Barcamp.Auth
  alias Barcamp.Auth.User
  alias BarcampWeb.Guardian.Tokenizer.Plug, as: GuardianPlug

  def new(conn, _params) do
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.authenticate_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User authenticated successfully.")
        |> GuardianPlug.sign_in(user)
        |> redirect(to: page_path(conn, :index))
      {:error, :incorrect} ->
        conn
        |> put_flash(:info, "User authenticated failed.")
        |> render("new.html", changeset: Auth.change_user(%User{}))
    end
  end

  def delete(conn, _) do
    conn
    |> GuardianPlug.sign_out()
    |> redirect(to: page_path(conn, :index))
  end
end
