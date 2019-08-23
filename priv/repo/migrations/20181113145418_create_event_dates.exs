defmodule Barcamp.Repo.Migrations.CreateEventDates do
  use Ecto.Migration

  def change do
    create table(:event_dates) do
      add :event_date, :utc_datetime
      add :event_id, references(:events, on_delete: :nothing)

      timestamps()
    end

    create index(:event_dates, [:event_id])
  end
end
