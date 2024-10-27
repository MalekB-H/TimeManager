defmodule Api.Repo.Migrations.AddNameToTeams do
  use Ecto.Migration

  def change do
    alter table(:teams) do
      add :name, :string, null: false
    end
  end
end