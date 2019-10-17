defmodule Barcamp.Schedule.Presentation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "presentations" do
    field(:contact, :string)
    field(:description, :string)
    field(:format, :string)
    field(:presenter, :string)
    field(:title, :string)

    belongs_to(:room, Barcamp.Schedule.Room)
    belongs_to(:time_slot, Barcamp.Schedule.TimeSlot)
    belongs_to(:event_date, Barcamp.Schedule.EventDate)

    timestamps()
  end

  @doc false
  def changeset(presentation, attrs) do
    presentation
    |> cast(attrs, [:title, :presenter, :contact, :description, :format])
    |> validate_required([:title, :presenter, :contact, :description, :format])
  end
end
