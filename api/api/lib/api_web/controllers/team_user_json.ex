defmodule ApiWeb.Team_userJSON do
  alias Api.Accounts.Team_user

  @doc """
  Renders a list of teams_users.
  """
  def index(%{teams_users: teams_users}) do
    %{data: for(team_user <- teams_users, do: data(team_user))}
  end

  @doc """
  Renders a single team_user.
  """
  def show(%{team_user: team_user}) do
    %{data: data(team_user)}
  end

  defp data(%Team_user{} = team_user) do
    %{
      id: team_user.id
    }
  end
end
