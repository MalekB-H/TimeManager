defmodule Api.Accounts.Team_user do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams_users" do

    field :user_id, :id
    field :team_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team_user, attrs) do
    team_user
    |> cast(attrs, [])
    |> validate_required([])
  end
end
