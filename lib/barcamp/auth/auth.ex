defmodule Barcamp.Auth do
  @moduledoc """
  The Auth context.
  """
  import Ecto.Query, warn: false
  alias Barcamp.Repo
  alias Barcamp.Auth.User
  alias Comeonin.Bcrypt

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
  
  def authenticate_user(%{"email" => email, "password" => pass}) do
    email
    |> fetch_user_by_email()
    |> check_password(pass)
  end
  
  def fetch_user_by_email(email) do
    User
    |> where([user], user.email == ^email)
    |> Repo.one
  end
  
  defp check_password(%User{} = user, password) do
    password
     |> Bcrypt.checkpw(user.password)
     |> case do
       true ->
         {:ok, user}
       false ->
         Bcrypt.dummy_checkpw()
         {:error, :incorrect}
     end
  end

  defp check_password(_, _), do: {:error, :incorrect}
end
