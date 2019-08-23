defmodule Barcamp.Schedule.Presentation do
  use Ecto.Schema
  import Ecto.Changeset


  schema "presentations" do
    field :contact, :string
    field :description, :string
    field :format, :string
    field :presenter, :string
    field :title, :string
    field :room_id, :id
    field :time_slot_id, :id

    timestamps()
  end

  @doc false
  def changeset(presentation, attrs) do
    presentation
    |> cast(attrs, [:title, :presenter, :contact, :description, :format])
    |> validate_required([:title, :presenter, :contact, :description, :format])
  end
end
