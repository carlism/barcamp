defmodule Barcamp.Repo.Migrations.CreateTimeSlots do
  use Ecto.Migration

  def change do
    create table(:time_slots) do
      add :start_time, :utc_datetime
      add :duration, :integer
      add :event_date_id, references(:event_dates, on_delete: :nothing)

      timestamps()
    end

    create index(:time_slots, [:event_date_id])
  end
end
