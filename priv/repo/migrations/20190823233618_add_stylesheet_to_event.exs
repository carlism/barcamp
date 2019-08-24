defmodule Barcamp.Repo.Migrations.AddStylesheetToEvent do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add(:stylesheet, :text)
    end
  end
end
