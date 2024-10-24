defmodule Api.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do

    field :manager_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [])
    |> validate_required([])
  end
end
