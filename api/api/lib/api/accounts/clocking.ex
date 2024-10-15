defmodule Api.Accounts.Clocking do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clockings" do
    field :clock_in, :utc_datetime
    field :clock_out, :utc_datetime
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(clocking, attrs) do
    clocking
    |> cast(attrs, [:clock_in, :clock_out, :user_id])
    |> validate_required([:clock_in, :user_id])
  end
end
