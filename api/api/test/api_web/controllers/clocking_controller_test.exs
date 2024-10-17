defmodule ApiWeb.ClockingControllerTest do
  use ApiWeb.ConnCase

  import Api.AccountsFixtures

  alias Api.Accounts.Clocking

  @create_attrs %{
    clock_in: ~U[2024-10-09 09:20:00Z],
    clock_out: ~U[2024-10-09 09:20:00Z]
  }
  @update_attrs %{
    clock_in: ~U[2024-10-10 09:20:00Z],
    clock_out: ~U[2024-10-10 09:20:00Z]
  }
  @invalid_attrs %{clock_in: nil, clock_out: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clockings", %{conn: conn} do
      conn = get(conn, ~p"/api/clockings")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create clocking" do
    test "renders clocking when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/clockings", clocking: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/clockings/#{id}")

      assert %{
               "id" => ^id,
               "clock_in" => "2024-10-09T09:20:00Z",
               "clock_out" => "2024-10-09T09:20:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/clockings", clocking: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update clocking" do
    setup [:create_clocking]

    test "renders clocking when data is valid", %{conn: conn, clocking: %Clocking{id: id} = clocking} do
      conn = put(conn, ~p"/api/clockings/#{clocking}", clocking: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/clockings/#{id}")

      assert %{
               "id" => ^id,
               "clock_in" => "2024-10-10T09:20:00Z",
               "clock_out" => "2024-10-10T09:20:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, clocking: clocking} do
      conn = put(conn, ~p"/api/clockings/#{clocking}", clocking: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete clocking" do
    setup [:create_clocking]

    test "deletes chosen clocking", %{conn: conn, clocking: clocking} do
      conn = delete(conn, ~p"/api/clockings/#{clocking}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/clockings/#{clocking}")
      end
    end
  end

  defp create_clocking(_) do
    clocking = clocking_fixture()
    %{clocking: clocking}
  end
end
