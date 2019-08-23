defmodule Barcamp.Schedule.Room do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rooms" do
    field :capacity, :integer
    field :display_position, :integer
    field :location, :string
    field :name, :string

    belongs_to :event_date, Barcamp.Schedule.EventDate

    timestamps()
  end

  @doc false
  def changeset(room, attrs) do
    room
    |> cast(attrs, [:name, :location, :capacity, :display_position])
    |> validate_required([:name, :location, :capacity, :display_position])
  end
end
