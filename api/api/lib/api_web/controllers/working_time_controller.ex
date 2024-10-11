defmodule ApiWeb.WorkingTimeController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.WorkingTime

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    working_times = Accounts.list_working_times()
    render(conn, :index, working_times: working_times)
  end

  def create(conn, %{"userID" => user_id, "working_time" => working_time_params}) do
    case Accounts.get_user(user_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: TodolistWeb.ErrorJSON)
        |> render(:"404", message: "User not found")
      user ->
        working_time_params = Map.put(working_time_params, "user_id", String.to_integer(user_id))
        with {:ok, %WorkingTime{} = working_time} <- Accounts.create_working_time(working_time_params) do
          conn
          |> put_status(:created)
          |> put_resp_header("location", ~p"/api/working_times/#{working_time}")
          |> render(:show, working_time: working_time)
        end
    end
  end

  def show_user_working_time(conn, %{"userID" => user_id, "id" => id}) do
    case Accounts.get_user(user_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: TodolistWeb.ErrorJSON)
        |> render(:"404", message: "User not found")
      _user ->
        case Accounts.get_user_working_time(user_id, id) do
          nil ->
            conn
            |> put_status(:not_found)
            |> put_view(json: TodolistWeb.ErrorJSON)
            |> render(:"404", message: "Working time not found for this user")
          working_time ->
            render(conn, :show, working_time: working_time)
        end
    end
  end

  def list_user_working_times(conn, %{"userID" => user_id} = params) do
    case Accounts.get_user(user_id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> put_view(json: TodolistWeb.ErrorJSON)
        |> render(:"404", message: "User not found")
      _user ->
        start_time = params["start_time"]
        end_time = params["end_time"]
        working_times = Accounts.list_user_working_times(user_id, start_time, end_time)
        render(conn, :index, working_times: working_times)
    end
  end

  def show(conn, %{"id" => id}) do
    working_time = Accounts.get_working_time!(id)
    render(conn, :show, working_time: working_time)
  end

  def update(conn, %{"id" => id, "working_time" => working_time_params}) do
    working_time = Accounts.get_working_time!(id)

    with {:ok, %WorkingTime{} = working_time} <- Accounts.update_working_time(working_time, working_time_params) do
      render(conn, :show, working_time: working_time)
    end
  end

  def delete(conn, %{"id" => id}) do
    working_time = Accounts.get_working_time!(id)

    with {:ok, %WorkingTime{}} <- Accounts.delete_working_time(working_time) do
      send_resp(conn, :no_content, "")
    end
  end
end
