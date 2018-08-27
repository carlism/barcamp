defmodule BarcampWeb.Guardian.Tokenizer do
  use Guardian, otp_app: :barcamp
  alias Barcamp.Membership
  
  def subject_for_token(%{id: id}, _) do
    {:ok, to_string(id)}
  end
  
  def resource_from_claims(claims) do
    case Membership.get_user(claims["sub"]) do
      nil -> {:error, :resource_not_found}
      user -> {:ok, user}
    end
  end
end