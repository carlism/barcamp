defmodule Barcamp.Schedule.Event do
  use Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :description, :string
    field :image_url, :string
    field :name, :string
    field :site_url, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:name, :site_url, :image_url, :description])
    |> validate_required([:name, :description])
  end
end
