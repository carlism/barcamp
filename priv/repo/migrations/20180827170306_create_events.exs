defmodule Barcamp.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :site_url, :string
      add :image_url, :string
      add :description, :string

      timestamps()
    end

  end
end
