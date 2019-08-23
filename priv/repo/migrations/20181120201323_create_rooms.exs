defmodule Barcamp.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :name, :string
      add :location, :string
      add :capacity, :integer
      add :display_position, :integer
      add :event_date_id, references(:event_dates, on_delete: :nothing)

      timestamps()
    end

    create index(:rooms, [:event_date_id])
  end
end
