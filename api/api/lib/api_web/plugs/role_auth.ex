defmodule ApiWeb.RoleAuth do
  import Plug.Conn
  import Phoenix.Controller

  def init(roles), do: roles

  def call(conn, roles) do
    user = Guardian.Plug.current_resource(conn)

    if user && user.role in roles do
      conn
    else
      conn
      |> put_status(:forbidden)
      |> json(%{error: "Unauthorized access"})
      |> halt()
    end
  end
end