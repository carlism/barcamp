defmodule Barcamp.Repo.Migrations.AddEvtdateToPresentation do
  use Ecto.Migration

  def change do
    alter table(:presentations) do
      add(:event_date_id, references(:event_dates, on_delete: :nothing))
    end

    create(index(:presentations, [:event_date_id]))
  end
end
