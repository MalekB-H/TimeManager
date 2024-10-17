defmodule Api.Repo.Migrations.AddRoleToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :role, :string, default: "employee"
    end
  end
end
