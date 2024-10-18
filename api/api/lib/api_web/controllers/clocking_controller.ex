defmodule ApiWeb.ClockingController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.Clocking

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    clockings = Accounts.list_clockings()
    render(conn, :index, clockings: clockings)
  end

  def start_clocking(conn, %{"userID" => user_id}) do
    case Accounts.get_user(user_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: ApiWeb.ErrorJSON)
        |> render(:"404", message: "User not found")
      user ->
        clocking_params = %{
          "user_id" => String.to_integer(user_id),
          "clock_in" => DateTime.utc_now()
        }
        with {:ok, %Clocking{} = clocking} <- Accounts.create_clocking(clocking_params) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", ~p"/api/clockings/#{clocking}")
          |> render(:show, clocking: clocking)
        end
    end
  end

  def end_clocking(conn, %{"userID" => user_id}) do
    case Accounts.get_user(user_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: ApiWeb.ErrorJSON)
        |> render(:"404", message: "User not found")
      user ->
        clocking_params = %{
          "clock_out" => DateTime.utc_now()
        }
        with {:ok, %Clocking{} = clocking} <- Accounts.update_clocking(clocking_params) do
          conn
          |> put_status(:modified)
          |> put_resp_header("location", ~p"/api/clockings/#{clocking}")
          |> render(:show, clocking: clocking)
        end
    end
  end

  def list_user_clockings(conn, %{"userID" => user_id}) do
    case Accounts.get_user(user_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: ApiWeb.ErrorJSON)
        |> render(:"404", message: "User not found")
      _user ->
        clockings = Accounts.list_user_clockings(user_id)
        render(conn, :index, clockings: clockings)
    end
  end

  def show(conn, %{"id" => id}) do
    clocking = Accounts.get_clocking!(id)
    render(conn, :show, clocking: clocking)
  end

  def update(conn, %{"id" => id, "clocking" => clocking_params}) do
    clocking = Accounts.get_clocking!(id)

    with {:ok, %Clocking{} = clocking} <- Accounts.update_clocking(clocking, clocking_params) do
      render(conn, :show, clocking: clocking)
    end
  end

  def delete(conn, %{"id" => id}) do
    clocking = Accounts.get_clocking!(id)

    with {:ok, %Clocking{}} <- Accounts.delete_clocking(clocking) do
      send_resp(conn, :no_content, "")
    end
  end
end
