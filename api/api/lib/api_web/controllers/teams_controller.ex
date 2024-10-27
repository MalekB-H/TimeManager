defmodule ApiWeb.TeamsController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Team

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    teams = Accounts.list_teams()
    render(conn, :index, teams: teams)
  end

  def create(conn, params) do
    team_params = %{
      "name" => params["name"],
      "manager_id" => params["manager_id"]
    }

    with {:ok, %Team{} = team} <- Accounts.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/teams/#{team.id}")
      |> json(%{
        data: %{
          id: team.id,
          name: team.name,
          manager_id: team.manager_id
        }
      })
    end
  end

  def show(conn, %{"id" => id}) do
    team = Accounts.get_team!(id)
    json(conn, %{
      data: %{
        id: team.id,
        name: team.name,
        manager_id: team.manager_id
      }
    })
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Accounts.get_team!(id)

    with {:ok, %Team{} = team} <- Accounts.update_team(team, team_params) do
      json(conn, %{
        data: %{
          id: team.id,
          name: team.name,
          manager_id: team.manager_id
        }
      })
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Accounts.get_team!(id)

    with {:ok, %Team{}} <- Accounts.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end