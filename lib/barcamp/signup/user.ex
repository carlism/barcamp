defmodule Barcamp.Signup.User do
  use Ecto.Schema
  import Ecto.Changeset

  @bad_passwords ~w(
    12345678
    password1
    qwertyuiop
  )

  schema "users" do
    field(:email, :string)
    field(:password, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> unique_constraint(:email)
    |> validate_exclusion(
      :password,
      @bad_passwords,
      message: "That password is too common."
    )
    |> validate_length(:password, min: 8)
    |> put_pass_hash()
  end

  defp put_pass_hash(%{valid?: true, changes: params} = changeset) do
    password = Bcrypt.hash_pwd_salt(params[:password])
    change(changeset, password: password)
  end

  defp put_pass_hash(changeset) do
    change(changeset, password: "")
  end
end
