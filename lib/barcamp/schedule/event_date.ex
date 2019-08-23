defmodule Barcamp.Schedule.EventDate do
  use Ecto.Schema
  import Ecto.Changeset


  schema "event_dates" do
    field :event_date, :utc_datetime

    belongs_to :event, Barcamp.Schedule.Event
    has_many :rooms, Barcamp.Schedule.Room
    has_many :time_slots, Barcamp.Schedule.TimeSlot
    
    timestamps()
  end

  @doc false
  def changeset(event_date, attrs) do
    event_date
    |> cast(attrs, [:event_date])
    |> validate_required([:event_date])
  end
end
