defmodule Barcamp.Repo.Migrations.CreatePresentations do
  use Ecto.Migration

  def change do
    create table(:presentations) do
      add :title, :string
      add :presenter, :string
      add :contact, :string
      add :description, :text
      add :format, :string
      add :room_id, references(:rooms, on_delete: :nothing)
      add :time_slot_id, references(:time_slots, on_delete: :nothing)

      timestamps()
    end

    create index(:presentations, [:room_id])
    create index(:presentations, [:time_slot_id])
  end
end
