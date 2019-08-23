defmodule Barcamp.Schedule.TimeSlot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "time_slots" do
    field :duration, :integer
    field :start_time, :utc_datetime
    belongs_to :event_date, Barcamp.Schedule.EventDate

    timestamps()
  end

  @doc false
  def changeset(time_slot, attrs) do
    time_slot
    |> cast(attrs, [:start_time, :duration])
    |> validate_required([:start_time, :duration])
  end
end
