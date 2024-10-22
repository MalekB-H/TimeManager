defmodule ApiWeb.Team_userController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Team_user

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    teams_users = Accounts.list_teams_users()
    render(conn, :index, teams_users: teams_users)
  end

  def create(conn, %{"manage" => team_user_params}) do
    with {:ok, %Team_user{} = team_user} <- Accounts.create_team_user(team_user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/manage/#{team_user}")
      |> render(:show, team_user: team_user)
    end
  end

  def show(conn, %{"id" => id}) do
    team_user = Accounts.get_team_user!(id)
    render(conn, :show, team_user: team_user)
  end

  def update(conn, %{"id" => id, "manage" => team_user_params}) do
    team_user = Accounts.get_team_user!(id)

    with {:ok, %Team_user{} = team_user} <- Accounts.update_team_user(team_user, team_user_params) do
      render(conn, :show, team_user: team_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    team_user = Accounts.get_team_user!(id)

    with {:ok, %Team_user{}} <- Accounts.delete_team_user(team_user) do
      send_resp(conn, :no_content, "")
    end
  end
end
