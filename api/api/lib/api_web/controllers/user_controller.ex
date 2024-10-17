defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  alias Api.Accounts
  alias Api.Accounts.User

  action_fallback ApiWeb.FallbackController

  def index(conn, params) do
    users = case params do
      %{"email" => email, "username" => username} ->
        Accounts.search_users(email: email, username: username)
      %{"email" => email} ->
        Accounts.search_users(email: email)
      %{"username" => username} ->
        Accounts.search_users(username: username)
      _ ->
        Accounts.list_users()
    end
    render(conn, :index, users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, :show, user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, :show, user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
