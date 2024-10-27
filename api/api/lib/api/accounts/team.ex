defmodule Api.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    belongs_to :manager, Api.Accounts.User
    many_to_many :members, Api.Accounts.User, join_through: "teams_users"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :manager_id])
    |> validate_required([:name, :manager_id])
    |> foreign_key_constraint(:manager_id)
  end
end