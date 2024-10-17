defmodule Api.AccountsTest do
  use Api.DataCase

  alias Api.Accounts

  describe "users" do
    alias Api.Accounts.User

    import Api.AccountsFixtures

    @invalid_attrs %{username: nil, email: nil, password_hash: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{username: "some username", email: "some email", password_hash: "some password_hash"}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.username == "some username"
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{username: "some updated username", email: "some updated email", password_hash: "some updated password_hash"}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.username == "some updated username"
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-07 14:44:00Z], end_time: ~U[2024-10-07 14:44:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-07 14:44:00Z]
      assert working_time.end_time == ~U[2024-10-07 14:44:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-08 14:44:00Z], end_time: ~U[2024-10-08 14:44:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-08 14:44:00Z]
      assert working_time.end_time == ~U[2024-10-08 14:44:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-07 14:44:00Z], clock_out: ~U[2024-10-07 14:44:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-07 14:44:00Z]
      assert clocking.clock_out == ~U[2024-10-07 14:44:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-08 14:44:00Z], clock_out: ~U[2024-10-08 14:44:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-08 14:44:00Z]
      assert clocking.clock_out == ~U[2024-10-08 14:44:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 09:23:00Z], end_time: ~U[2024-10-08 09:23:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 09:23:00Z]
      assert working_time.end_time == ~U[2024-10-08 09:23:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 09:23:00Z], end_time: ~U[2024-10-09 09:23:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:23:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:23:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 09:23:00Z], clock_out: ~U[2024-10-08 09:23:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 09:23:00Z]
      assert clocking.clock_out == ~U[2024-10-08 09:23:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 09:23:00Z], clock_out: ~U[2024-10-09 09:23:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:23:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:23:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 09:44:00Z], end_time: ~U[2024-10-08 09:44:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 09:44:00Z]
      assert working_time.end_time == ~U[2024-10-08 09:44:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 09:44:00Z], end_time: ~U[2024-10-09 09:44:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:44:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:44:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 09:44:00Z], clock_out: ~U[2024-10-08 09:44:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 09:44:00Z]
      assert clocking.clock_out == ~U[2024-10-08 09:44:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 09:44:00Z], clock_out: ~U[2024-10-09 09:44:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:44:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:44:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 09:51:00Z], end_time: ~U[2024-10-08 09:51:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 09:51:00Z]
      assert working_time.end_time == ~U[2024-10-08 09:51:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 09:51:00Z], end_time: ~U[2024-10-09 09:51:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:51:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:51:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 09:51:00Z], clock_out: ~U[2024-10-08 09:51:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 09:51:00Z]
      assert clocking.clock_out == ~U[2024-10-08 09:51:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 09:51:00Z], clock_out: ~U[2024-10-09 09:51:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:51:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:51:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 10:00:00Z], end_time: ~U[2024-10-08 10:00:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 10:00:00Z]
      assert working_time.end_time == ~U[2024-10-08 10:00:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 10:00:00Z], end_time: ~U[2024-10-09 10:00:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 10:00:00Z]
      assert working_time.end_time == ~U[2024-10-09 10:00:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 10:01:00Z], end_time: ~U[2024-10-08 10:01:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 10:01:00Z]
      assert working_time.end_time == ~U[2024-10-08 10:01:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 10:01:00Z], end_time: ~U[2024-10-09 10:01:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 10:01:00Z]
      assert working_time.end_time == ~U[2024-10-09 10:01:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 10:01:00Z], clock_out: ~U[2024-10-08 10:01:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 10:01:00Z]
      assert clocking.clock_out == ~U[2024-10-08 10:01:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 10:01:00Z], clock_out: ~U[2024-10-09 10:01:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 10:01:00Z]
      assert clocking.clock_out == ~U[2024-10-09 10:01:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 10:03:00Z], end_time: ~U[2024-10-08 10:03:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 10:03:00Z]
      assert working_time.end_time == ~U[2024-10-08 10:03:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 10:03:00Z], end_time: ~U[2024-10-09 10:03:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 10:03:00Z]
      assert working_time.end_time == ~U[2024-10-09 10:03:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 10:03:00Z], clock_out: ~U[2024-10-08 10:03:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 10:03:00Z]
      assert clocking.clock_out == ~U[2024-10-08 10:03:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 10:03:00Z], clock_out: ~U[2024-10-09 10:03:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 10:03:00Z]
      assert clocking.clock_out == ~U[2024-10-09 10:03:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 10:06:00Z], end_time: ~U[2024-10-08 10:06:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 10:06:00Z]
      assert working_time.end_time == ~U[2024-10-08 10:06:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 10:06:00Z], end_time: ~U[2024-10-09 10:06:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 10:06:00Z]
      assert working_time.end_time == ~U[2024-10-09 10:06:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 10:06:00Z], clock_out: ~U[2024-10-08 10:06:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 10:06:00Z]
      assert clocking.clock_out == ~U[2024-10-08 10:06:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 10:06:00Z], clock_out: ~U[2024-10-09 10:06:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 10:06:00Z]
      assert clocking.clock_out == ~U[2024-10-09 10:06:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 10:08:00Z], end_time: ~U[2024-10-08 10:08:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 10:08:00Z]
      assert working_time.end_time == ~U[2024-10-08 10:08:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 10:08:00Z], end_time: ~U[2024-10-09 10:08:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 10:08:00Z]
      assert working_time.end_time == ~U[2024-10-09 10:08:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 10:08:00Z], clock_out: ~U[2024-10-08 10:08:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 10:08:00Z]
      assert clocking.clock_out == ~U[2024-10-08 10:08:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 10:08:00Z], clock_out: ~U[2024-10-09 10:08:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 10:08:00Z]
      assert clocking.clock_out == ~U[2024-10-09 10:08:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-08 13:34:00Z], end_time: ~U[2024-10-08 13:34:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-08 13:34:00Z]
      assert working_time.end_time == ~U[2024-10-08 13:34:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-09 13:34:00Z], end_time: ~U[2024-10-09 13:34:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-09 13:34:00Z]
      assert working_time.end_time == ~U[2024-10-09 13:34:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-08 13:34:00Z], clock_out: ~U[2024-10-08 13:34:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-08 13:34:00Z]
      assert clocking.clock_out == ~U[2024-10-08 13:34:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-09 13:34:00Z], clock_out: ~U[2024-10-09 13:34:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-09 13:34:00Z]
      assert clocking.clock_out == ~U[2024-10-09 13:34:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 08:10:00Z], end_time: ~U[2024-10-09 08:10:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 08:10:00Z]
      assert working_time.end_time == ~U[2024-10-09 08:10:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 08:10:00Z], end_time: ~U[2024-10-10 08:10:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 08:10:00Z]
      assert working_time.end_time == ~U[2024-10-10 08:10:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 08:10:00Z], clock_out: ~U[2024-10-09 08:10:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 08:10:00Z]
      assert clocking.clock_out == ~U[2024-10-09 08:10:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 08:10:00Z], clock_out: ~U[2024-10-10 08:10:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 08:10:00Z]
      assert clocking.clock_out == ~U[2024-10-10 08:10:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 08:23:00Z], end_time: ~U[2024-10-09 08:23:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 08:23:00Z]
      assert working_time.end_time == ~U[2024-10-09 08:23:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 08:23:00Z], end_time: ~U[2024-10-10 08:23:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 08:23:00Z]
      assert working_time.end_time == ~U[2024-10-10 08:23:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 08:23:00Z], clock_out: ~U[2024-10-09 08:23:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 08:23:00Z]
      assert clocking.clock_out == ~U[2024-10-09 08:23:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 08:23:00Z], clock_out: ~U[2024-10-10 08:23:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 08:23:00Z]
      assert clocking.clock_out == ~U[2024-10-10 08:23:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 08:34:00Z], end_time: ~U[2024-10-09 08:34:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 08:34:00Z]
      assert working_time.end_time == ~U[2024-10-09 08:34:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 08:34:00Z], end_time: ~U[2024-10-10 08:34:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 08:34:00Z]
      assert working_time.end_time == ~U[2024-10-10 08:34:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 08:34:00Z], clock_out: ~U[2024-10-09 08:34:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 08:34:00Z]
      assert clocking.clock_out == ~U[2024-10-09 08:34:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 08:34:00Z], clock_out: ~U[2024-10-10 08:34:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 08:34:00Z]
      assert clocking.clock_out == ~U[2024-10-10 08:34:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 08:37:00Z], end_time: ~U[2024-10-09 08:37:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 08:37:00Z]
      assert working_time.end_time == ~U[2024-10-09 08:37:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 08:37:00Z], end_time: ~U[2024-10-10 08:37:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 08:37:00Z]
      assert working_time.end_time == ~U[2024-10-10 08:37:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 08:37:00Z], clock_out: ~U[2024-10-09 08:37:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 08:37:00Z]
      assert clocking.clock_out == ~U[2024-10-09 08:37:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 08:37:00Z], clock_out: ~U[2024-10-10 08:37:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 08:37:00Z]
      assert clocking.clock_out == ~U[2024-10-10 08:37:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:04:00Z], end_time: ~U[2024-10-09 09:04:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:04:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:04:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:04:00Z], end_time: ~U[2024-10-10 09:04:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:04:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:04:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:04:00Z], clock_out: ~U[2024-10-09 09:04:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:04:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:04:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:04:00Z], clock_out: ~U[2024-10-10 09:04:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:04:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:04:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:07:00Z], end_time: ~U[2024-10-09 09:07:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:07:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:07:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:07:00Z], end_time: ~U[2024-10-10 09:07:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:07:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:07:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:07:00Z], clock_out: ~U[2024-10-09 09:07:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:07:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:07:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:07:00Z], clock_out: ~U[2024-10-10 09:07:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:07:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:07:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:08:00Z], end_time: ~U[2024-10-09 09:08:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:08:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:08:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:08:00Z], end_time: ~U[2024-10-10 09:08:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:08:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:08:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:08:00Z], clock_out: ~U[2024-10-09 09:08:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:08:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:08:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:08:00Z], clock_out: ~U[2024-10-10 09:08:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:08:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:08:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:09:00Z], end_time: ~U[2024-10-09 09:09:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:09:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:09:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:09:00Z], end_time: ~U[2024-10-10 09:09:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:09:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:09:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:09:00Z], clock_out: ~U[2024-10-09 09:09:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:09:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:09:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:09:00Z], clock_out: ~U[2024-10-10 09:09:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:09:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:09:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:15:00Z], end_time: ~U[2024-10-09 09:15:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:15:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:15:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:15:00Z], end_time: ~U[2024-10-10 09:15:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:15:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:15:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:15:00Z], clock_out: ~U[2024-10-09 09:15:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:15:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:15:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:15:00Z], clock_out: ~U[2024-10-10 09:15:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:15:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:15:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:19:00Z], end_time: ~U[2024-10-09 09:19:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:19:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:19:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:19:00Z], end_time: ~U[2024-10-10 09:19:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:19:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:19:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:19:00Z], clock_out: ~U[2024-10-09 09:19:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:19:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:19:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:19:00Z], clock_out: ~U[2024-10-10 09:19:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:19:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:19:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:20:00Z], end_time: ~U[2024-10-09 09:20:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:20:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:20:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:20:00Z], end_time: ~U[2024-10-10 09:20:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:20:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:20:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end

  describe "clockings" do
    alias Api.Accounts.Clocking

    import Api.AccountsFixtures

    @invalid_attrs %{clock_in: nil, clock_out: nil}

    test "list_clockings/0 returns all clockings" do
      clocking = clocking_fixture()
      assert Accounts.list_clockings() == [clocking]
    end

    test "get_clocking!/1 returns the clocking with given id" do
      clocking = clocking_fixture()
      assert Accounts.get_clocking!(clocking.id) == clocking
    end

    test "create_clocking/1 with valid data creates a clocking" do
      valid_attrs = %{clock_in: ~U[2024-10-09 09:20:00Z], clock_out: ~U[2024-10-09 09:20:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.create_clocking(valid_attrs)
      assert clocking.clock_in == ~U[2024-10-09 09:20:00Z]
      assert clocking.clock_out == ~U[2024-10-09 09:20:00Z]
    end

    test "create_clocking/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_clocking(@invalid_attrs)
    end

    test "update_clocking/2 with valid data updates the clocking" do
      clocking = clocking_fixture()
      update_attrs = %{clock_in: ~U[2024-10-10 09:20:00Z], clock_out: ~U[2024-10-10 09:20:00Z]}

      assert {:ok, %Clocking{} = clocking} = Accounts.update_clocking(clocking, update_attrs)
      assert clocking.clock_in == ~U[2024-10-10 09:20:00Z]
      assert clocking.clock_out == ~U[2024-10-10 09:20:00Z]
    end

    test "update_clocking/2 with invalid data returns error changeset" do
      clocking = clocking_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_clocking(clocking, @invalid_attrs)
      assert clocking == Accounts.get_clocking!(clocking.id)
    end

    test "delete_clocking/1 deletes the clocking" do
      clocking = clocking_fixture()
      assert {:ok, %Clocking{}} = Accounts.delete_clocking(clocking)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_clocking!(clocking.id) end
    end

    test "change_clocking/1 returns a clocking changeset" do
      clocking = clocking_fixture()
      assert %Ecto.Changeset{} = Accounts.change_clocking(clocking)
    end
  end

  describe "working_times" do
    alias Api.Accounts.WorkingTime

    import Api.AccountsFixtures

    @invalid_attrs %{start_time: nil, end_time: nil}

    test "list_working_times/0 returns all working_times" do
      working_time = working_time_fixture()
      assert Accounts.list_working_times() == [working_time]
    end

    test "get_working_time!/1 returns the working_time with given id" do
      working_time = working_time_fixture()
      assert Accounts.get_working_time!(working_time.id) == working_time
    end

    test "create_working_time/1 with valid data creates a working_time" do
      valid_attrs = %{start_time: ~U[2024-10-09 09:27:00Z], end_time: ~U[2024-10-09 09:27:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.create_working_time(valid_attrs)
      assert working_time.start_time == ~U[2024-10-09 09:27:00Z]
      assert working_time.end_time == ~U[2024-10-09 09:27:00Z]
    end

    test "create_working_time/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_working_time(@invalid_attrs)
    end

    test "update_working_time/2 with valid data updates the working_time" do
      working_time = working_time_fixture()
      update_attrs = %{start_time: ~U[2024-10-10 09:27:00Z], end_time: ~U[2024-10-10 09:27:00Z]}

      assert {:ok, %WorkingTime{} = working_time} = Accounts.update_working_time(working_time, update_attrs)
      assert working_time.start_time == ~U[2024-10-10 09:27:00Z]
      assert working_time.end_time == ~U[2024-10-10 09:27:00Z]
    end

    test "update_working_time/2 with invalid data returns error changeset" do
      working_time = working_time_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_working_time(working_time, @invalid_attrs)
      assert working_time == Accounts.get_working_time!(working_time.id)
    end

    test "delete_working_time/1 deletes the working_time" do
      working_time = working_time_fixture()
      assert {:ok, %WorkingTime{}} = Accounts.delete_working_time(working_time)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_working_time!(working_time.id) end
    end

    test "change_working_time/1 returns a working_time changeset" do
      working_time = working_time_fixture()
      assert %Ecto.Changeset{} = Accounts.change_working_time(working_time)
    end
  end
end
