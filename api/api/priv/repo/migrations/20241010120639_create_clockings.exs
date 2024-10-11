defmodule Api.Repo.Migrations.CreateClockings do
  use Ecto.Migration

  def change do
    create table(:clockings) do
      add :clock_in, :utc_datetime
      add :clock_out, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:clockings, [:user_id])
  end
end
