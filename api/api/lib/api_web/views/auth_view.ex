defmodule ApiWeb.AuthJSON do
  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("register.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end

  def render("login.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end